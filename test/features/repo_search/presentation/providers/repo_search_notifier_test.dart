import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_repo_explorer/core/error/failures.dart';
import 'package:github_repo_explorer/core/utils/result.dart';
import 'package:github_repo_explorer/features/repo_search/domain/entities/github_repo.dart';
import 'package:github_repo_explorer/features/repo_search/domain/usecases/search_repositories_usecase.dart';
import 'package:github_repo_explorer/features/repo_search/presentation/providers/repo_providers.dart';
import 'package:github_repo_explorer/features/repo_search/presentation/providers/repo_search_notifier.dart';
import 'package:mocktail/mocktail.dart';

class _MockSearchUseCase extends Mock implements SearchRepositoriesUseCase {}

void main() {
  late _MockSearchUseCase useCase;

  final GithubRepo tRepo = GithubRepo(
    id: 1,
    name: 'riverpod',
    fullName: 'rrousselGit/riverpod',
    ownerLogin: 'rrousselGit',
    ownerAvatarUrl: 'https://x/y.png',
    stars: 5000,
    forks: 400,
    htmlUrl: 'https://github.com/rrousselGit/riverpod',
    updatedAt: DateTime(2026, 1, 1),
  );

  setUp(() {
    useCase = _MockSearchUseCase();
  });

  ProviderContainer makeContainer() {
    return ProviderContainer(
      overrides: [
        searchRepositoriesUseCaseProvider.overrideWithValue(useCase),
      ],
    );
  }

  test('build() triggers an initial discovery search and populates results', () async {
    when(() => useCase(query: any(named: 'query'), page: any(named: 'page')))
        .thenAnswer((_) async => Result.success([tRepo]));

    final ProviderContainer container = makeContainer();
    addTearDown(container.dispose);

    // build() schedules search('') via a microtask.
    container.read(repoSearchNotifierProvider);
    await Future<void>.delayed(Duration.zero);
    await Future<void>.delayed(Duration.zero);

    final state = container.read(repoSearchNotifierProvider);
    expect(state.isLoading, isFalse);
    expect(state.results, hasLength(1));
    expect(state.results.first.name, 'riverpod');
  });

  test('search() surfaces the failure message when the use case fails', () async {
    when(() => useCase(query: any(named: 'query'), page: any(named: 'page')))
        .thenAnswer((_) async => const Result.failure(ServerFailure()));

    final ProviderContainer container = makeContainer();
    addTearDown(container.dispose);

    await container.read(repoSearchNotifierProvider.notifier).search('flutter');

    final state = container.read(repoSearchNotifierProvider);
    expect(state.isLoading, isFalse);
    expect(state.errorMessage, isNotNull);
    expect(state.results, isEmpty);
  });
}
