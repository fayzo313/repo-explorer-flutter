import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/providers/core_providers.dart';
import '../../data/datasources/github_remote_datasource.dart';
import '../../data/datasources/repo_local_datasource.dart';
import '../../data/repositories/repo_repository_impl.dart';
import '../../domain/repositories/repo_repository.dart';
import '../../domain/usecases/search_repositories_usecase.dart';

/// -------------------------------------------------------------------
/// Dependency graph for the `repo_search` feature, wired bottom-up:
/// data sources -> repository -> use case. Every provider only ever
/// depends on the *interface* one layer below it, never a concrete
/// class, which is what makes swapping an implementation (e.g. for
/// tests, via ProviderScope overrides) a one-line change.
/// -------------------------------------------------------------------

final Provider<GithubRemoteDataSource> githubRemoteDataSourceProvider =
    Provider<GithubRemoteDataSource>((ref) {
  return GithubRemoteDataSourceImpl(ref.watch(dioProvider));
});

final Provider<RepoLocalDataSource> repoLocalDataSourceProvider =
    Provider<RepoLocalDataSource>((ref) {
  return RepoLocalDataSourceImpl(ref.watch(appDatabaseProvider));
});

final Provider<RepoRepository> repoRepositoryProvider = Provider<RepoRepository>((ref) {
  return RepoRepositoryImpl(
    remoteDataSource: ref.watch(githubRemoteDataSourceProvider),
    localDataSource: ref.watch(repoLocalDataSourceProvider),
    networkInfo: ref.watch(networkInfoProvider),
  );
});

final Provider<SearchRepositoriesUseCase> searchRepositoriesUseCaseProvider =
    Provider<SearchRepositoriesUseCase>((ref) {
  return SearchRepositoriesUseCase(ref.watch(repoRepositoryProvider));
});
