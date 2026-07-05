import 'package:flutter_test/flutter_test.dart';
import 'package:github_repo_explorer/core/database/app_database.dart';
import 'package:github_repo_explorer/core/error/exceptions.dart';
import 'package:github_repo_explorer/core/error/failures.dart';
import 'package:github_repo_explorer/core/network/network_info.dart';
import 'package:github_repo_explorer/core/utils/result.dart';
import 'package:github_repo_explorer/features/repo_search/data/datasources/github_remote_datasource.dart';
import 'package:github_repo_explorer/features/repo_search/data/datasources/repo_local_datasource.dart';
import 'package:github_repo_explorer/features/repo_search/data/models/github_repo_model.dart';
import 'package:github_repo_explorer/features/repo_search/data/repositories/repo_repository_impl.dart';
import 'package:github_repo_explorer/features/repo_search/domain/entities/github_repo.dart';
import 'package:mocktail/mocktail.dart';

class _MockRemote extends Mock implements GithubRemoteDataSource {}

class _MockLocal extends Mock implements RepoLocalDataSource {}

class _MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  late _MockRemote remote;
  late _MockLocal local;
  late _MockNetworkInfo networkInfo;
  late RepoRepositoryImpl repository;

  final GithubRepoModel tModel = GithubRepoModel(
    id: 1,
    name: 'flutter',
    fullName: 'flutter/flutter',
    owner: const GithubOwnerModel(login: 'flutter', avatarUrl: 'https://x/y.png'),
    stars: 150000,
    forks: 26000,
    htmlUrl: 'https://github.com/flutter/flutter',
    updatedAt: DateTime(2026, 1, 1),
    description: 'Flutter makes it easy to build apps',
    language: 'Dart',
  );

  setUp(() {
    remote = _MockRemote();
    local = _MockLocal();
    networkInfo = _MockNetworkInfo();
    repository = RepoRepositoryImpl(
      remoteDataSource: remote,
      localDataSource: local,
      networkInfo: networkInfo,
    );

    registerFallbackValue(tModel);
  });

  group('searchRepositories', () {
    test('returns Success with mapped entities when online and API succeeds', () async {
      when(() => networkInfo.isConnected).thenAnswer((_) async => true);
      when(() => remote.searchRepositories(query: any(named: 'query'), page: any(named: 'page')))
          .thenAnswer((_) async => [tModel]);
      when(() => local.cacheSearchResults(any(), any())).thenAnswer((_) async {});
      when(() => local.getFavorites()).thenAnswer((_) async => []);

      final Result<List<GithubRepo>> result =
          await repository.searchRepositories(query: 'flutter');

      expect(result.isSuccess, isTrue);
      result.when(
        success: (repos) {
          expect(repos, hasLength(1));
          expect(repos.first.name, 'flutter');
          expect(repos.first.isFavorite, isFalse);
        },
        failure: (_) => fail('expected success'),
      );
      verify(() => local.cacheSearchResults('flutter', [tModel])).called(1);
    });

    test('marks a repo as favorite when its id is in the favorites table', () async {
      when(() => networkInfo.isConnected).thenAnswer((_) async => true);
      when(() => remote.searchRepositories(query: any(named: 'query'), page: any(named: 'page')))
          .thenAnswer((_) async => [tModel]);
      when(() => local.cacheSearchResults(any(), any())).thenAnswer((_) async {});
      when(() => local.getFavorites()).thenAnswer(
        (_) async => [
          FavoriteRepository(
            id: 1,
            name: 'flutter',
            fullName: 'flutter/flutter',
            ownerLogin: 'flutter',
            ownerAvatarUrl: 'https://x/y.png',
            description: null,
            stars: 150000,
            forks: 26000,
            language: 'Dart',
            htmlUrl: 'https://github.com/flutter/flutter',
            updatedAt: DateTime(2026, 1, 1),
            favoritedAt: DateTime(2026, 1, 2),
          ),
        ],
      );

      final Result<List<GithubRepo>> result =
          await repository.searchRepositories(query: 'flutter');

      result.when(
        success: (repos) => expect(repos.first.isFavorite, isTrue),
        failure: (_) => fail('expected success'),
      );
    });

    test('falls back to cache and returns Failure_/NetworkFailure info when offline with no cache',
        () async {
      when(() => networkInfo.isConnected).thenAnswer((_) async => false);
      when(() => local.getCachedResults(any())).thenAnswer((_) async => []);
      when(() => local.getFavorites()).thenAnswer((_) async => []);

      final Result<List<GithubRepo>> result =
          await repository.searchRepositories(query: 'flutter');

      expect(result.isSuccess, isFalse);
      result.when(
        success: (_) => fail('expected failure'),
        failure: (failure) => expect(failure, isA<NetworkFailure>()),
      );
    });

    test('maps a RateLimitException from the remote source to RateLimitFailure', () async {
      when(() => networkInfo.isConnected).thenAnswer((_) async => true);
      when(() => remote.searchRepositories(query: any(named: 'query'), page: any(named: 'page')))
          .thenThrow(const RateLimitException());

      final Result<List<GithubRepo>> result =
          await repository.searchRepositories(query: 'flutter');

      result.when(
        success: (_) => fail('expected failure'),
        failure: (failure) => expect(failure, isA<RateLimitFailure>()),
      );
    });
  });

  group('toggleFavorite', () {
    test('adds to favorites when repo is not currently favorited', () async {
      when(() => local.isFavorite(1)).thenAnswer((_) async => false);
      when(() => local.toggleFavorite(any(), isFavorite: any(named: 'isFavorite')))
          .thenAnswer((_) async {});

      final GithubRepo repo = GithubRepo(
        id: 1,
        name: 'flutter',
        fullName: 'flutter/flutter',
        ownerLogin: 'flutter',
        ownerAvatarUrl: 'https://x/y.png',
        stars: 1,
        forks: 1,
        htmlUrl: 'https://github.com/flutter/flutter',
        updatedAt: DateTime(2026, 1, 1),
      );

      final Result<void> result = await repository.toggleFavorite(repo);

      expect(result.isSuccess, isTrue);
      verify(() => local.toggleFavorite(any(), isFavorite: true)).called(1);
    });
  });
}
