import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/utils/result.dart';
import '../../domain/entities/github_repo.dart';
import '../../domain/usecases/search_repositories_usecase.dart';
import 'repo_providers.dart';
import 'repo_search_state.dart';

/// Drives the Home screen's search UI.
///
/// A plain [Notifier] (not [AsyncNotifier]) is used deliberately: the
/// screen needs fine-grained sub-states (initial load vs. "load more"
/// pagination vs. offline banner) that don't map cleanly onto Riverpod's
/// single `AsyncValue`, so the notifier manages an explicit
/// [RepoSearchState] instead. See [FavoritesNotifier] for the
/// `AsyncNotifier` alternative used where a single async value *is*
/// the whole state.
class RepoSearchNotifier extends Notifier<RepoSearchState> {
  int _page = 1;

  @override
  RepoSearchState build() {
    // Kick off a default "discovery" search as soon as the Home screen
    // mounts, so the user never sees a blank screen.
    Future.microtask(() => search(''));
    return const RepoSearchState();
  }

  Future<void> search(String query) async {
    _page = 1;
    state = state.copyWith(
      query: query,
      isLoading: true,
      errorMessage: null,
      isOffline: false,
    );

    final SearchRepositoriesUseCase useCase =
        ref.read(searchRepositoriesUseCaseProvider);
    final Result<List<GithubRepo>> result =
        await useCase(query: query, page: _page);

    result.when(
      success: (data) {
        state = state.copyWith(
          results: data,
          isLoading: false,
          errorMessage: null,
        );
      },
      failure: (failure) {
        state = state.copyWith(
          isLoading: false,
          errorMessage: failure.message,
          isOffline: failure is NetworkFailure,
        );
      },
    );
  }

  Future<void> loadMore() async {
    if (state.isLoadingMore || state.isLoading) return;

    state = state.copyWith(isLoadingMore: true);
    _page += 1;

    final SearchRepositoriesUseCase useCase =
        ref.read(searchRepositoriesUseCaseProvider);
    final Result<List<GithubRepo>> result =
        await useCase(query: state.query, page: _page);

    result.when(
      success: (data) {
        state = state.copyWith(
          results: [...state.results, ...data],
          isLoadingMore: false,
        );
      },
      failure: (_) {
        _page -= 1; // revert - nothing new to show
        state = state.copyWith(isLoadingMore: false);
      },
    );
  }

  /// Re-runs the current query - used by pull-to-refresh and the
  /// error state's "Retry" button.
  Future<void> refresh() => search(state.query);
}

final NotifierProvider<RepoSearchNotifier, RepoSearchState> repoSearchNotifierProvider =
    NotifierProvider<RepoSearchNotifier, RepoSearchState>(RepoSearchNotifier.new);
