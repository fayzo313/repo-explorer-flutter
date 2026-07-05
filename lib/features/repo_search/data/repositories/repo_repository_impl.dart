import '../../../../core/database/app_database.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../../../core/utils/result.dart';
import '../../domain/entities/github_repo.dart';
import '../../domain/repositories/repo_repository.dart';
import '../datasources/github_remote_datasource.dart';
import '../datasources/repo_local_datasource.dart';
import '../models/github_repo_model.dart';

/// The concrete implementation of [RepoRepository].
///
/// This is the *only* class in the app that knows about both the
/// network and the database at once - it orchestrates them (network
/// first, cache fallback, cache-then-favorite-merge) so every other
/// layer can treat "get me some repos" as a single simple call.
class RepoRepositoryImpl implements RepoRepository {
  const RepoRepositoryImpl({
    required GithubRemoteDataSource remoteDataSource,
    required RepoLocalDataSource localDataSource,
    required NetworkInfo networkInfo,
  })  : _remote = remoteDataSource,
        _local = localDataSource,
        _networkInfo = networkInfo;

  final GithubRemoteDataSource _remote;
  final RepoLocalDataSource _local;
  final NetworkInfo _networkInfo;

  @override
  Future<Result<List<GithubRepo>>> searchRepositories({
    required String query,
    int page = 1,
  }) async {
    final bool online = await _networkInfo.isConnected;

    if (online) {
      try {
        final List<GithubRepoModel> remoteModels =
            await _remote.searchRepositories(query: query, page: page);

        // Best-effort cache write - failing to cache shouldn't fail the
        // whole request since we already have fresh data to show.
        try {
          await _local.cacheSearchResults(query, remoteModels);
        } on CacheException {
          // Swallow: caching is an optimization, not the primary goal.
        }

        final Set<int> favoriteIds = await _favoriteIds();
        final List<GithubRepo> entities = remoteModels
            .map((m) => m.toEntity(isFavorite: favoriteIds.contains(m.id)))
            .toList();
        return Result.success(entities);
      } on AppException catch (e) {
        return Result.failure(_toFailure(e));
      }
    }

    // Offline: fall back to whatever was cached for this exact query.
    return _readFromCache(query);
  }

  Future<Result<List<GithubRepo>>> _readFromCache(String query) async {
    try {
      final List<CachedRepository> cached = await _local.getCachedResults(query);
      if (cached.isEmpty) {
        return const Result.failure(
          NetworkFailure('No internet connection and nothing cached yet for this search.'),
        );
      }
      final Set<int> favoriteIds = await _favoriteIds();
      final List<GithubRepo> entities = cached
          .map((row) => row.toEntity(isFavorite: favoriteIds.contains(row.id)))
          .toList();
      return Result.success(entities);
    } on CacheException catch (e) {
      return Result.failure(CacheFailure(e.message));
    }
  }

  @override
  Future<Result<List<GithubRepo>>> getFavorites() async {
    try {
      final List<FavoriteRepository> rows = await _local.getFavorites();
      return Result.success(rows.map((r) => r.toEntity()).toList());
    } on CacheException catch (e) {
      return Result.failure(CacheFailure(e.message));
    }
  }

  @override
  Future<Result<void>> toggleFavorite(GithubRepo repo) async {
    try {
      final bool currentlyFavorite = await _local.isFavorite(repo.id);
      final GithubRepoModel model = GithubRepoModel(
        id: repo.id,
        name: repo.name,
        fullName: repo.fullName,
        owner: GithubOwnerModel(
          login: repo.ownerLogin,
          avatarUrl: repo.ownerAvatarUrl,
        ),
        stars: repo.stars,
        forks: repo.forks,
        htmlUrl: repo.htmlUrl,
        updatedAt: repo.updatedAt,
        description: repo.description,
        language: repo.language,
      );
      await _local.toggleFavorite(model, isFavorite: !currentlyFavorite);
      return const Result.success(null);
    } on CacheException catch (e) {
      return Result.failure(CacheFailure(e.message));
    }
  }

  @override
  Future<Result<bool>> isFavorite(int repoId) async {
    try {
      return Result.success(await _local.isFavorite(repoId));
    } on CacheException catch (e) {
      return Result.failure(CacheFailure(e.message));
    }
  }

  Future<Set<int>> _favoriteIds() async {
    try {
      final List<FavoriteRepository> favorites = await _local.getFavorites();
      return favorites.map((f) => f.id).toSet();
    } on CacheException {
      return <int>{};
    }
  }

  Failure _toFailure(AppException e) {
    return switch (e) {
      NetworkException() => NetworkFailure(e.message),
      RateLimitException() => RateLimitFailure(e.message),
      NotFoundException() => NotFoundFailure(e.message),
      ServerException() => ServerFailure(e.message),
      CacheException() => CacheFailure(e.message),
    };
  }
}

/// Maps a Drift-generated row into the domain entity.
extension CachedRepositoryMapper on CachedRepository {
  GithubRepo toEntity({bool isFavorite = false}) {
    return GithubRepo(
      id: id,
      name: name,
      fullName: fullName,
      ownerLogin: ownerLogin,
      ownerAvatarUrl: ownerAvatarUrl,
      stars: stars,
      forks: forks,
      htmlUrl: htmlUrl,
      updatedAt: updatedAt,
      description: description,
      language: language,
      isFavorite: isFavorite,
    );
  }
}

extension FavoriteRepositoryMapper on FavoriteRepository {
  GithubRepo toEntity() {
    return GithubRepo(
      id: id,
      name: name,
      fullName: fullName,
      ownerLogin: ownerLogin,
      ownerAvatarUrl: ownerAvatarUrl,
      stars: stars,
      forks: forks,
      htmlUrl: htmlUrl,
      updatedAt: updatedAt,
      description: description,
      language: language,
      isFavorite: true,
    );
  }
}
