import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../repo_search/domain/entities/github_repo.dart';
import '../../../repo_search/presentation/providers/repo_providers.dart';
import '../../domain/usecases/get_favorites_usecase.dart';
import '../../domain/usecases/toggle_favorite_usecase.dart';

final Provider<GetFavoritesUseCase> getFavoritesUseCaseProvider =
    Provider<GetFavoritesUseCase>((ref) {
  return GetFavoritesUseCase(ref.watch(repoRepositoryProvider));
});

final Provider<ToggleFavoriteUseCase> toggleFavoriteUseCaseProvider =
    Provider<ToggleFavoriteUseCase>((ref) {
  return ToggleFavoriteUseCase(ref.watch(repoRepositoryProvider));
});

/// Drives the Favorites screen.
///
/// This *is* a good fit for [AsyncNotifier] (unlike search) because the
/// entire screen state genuinely is "a list of favorites that's either
/// loading, loaded, or errored" - exactly what `AsyncValue` models.
class FavoritesNotifier extends AsyncNotifier<List<GithubRepo>> {
  @override
  Future<List<GithubRepo>> build() async {
    return _load();
  }

  Future<List<GithubRepo>> _load() async {
    final GetFavoritesUseCase useCase = ref.read(getFavoritesUseCaseProvider);
    final result = await useCase();
    return result.when(
      success: (data) => data,
      failure: (failure) => throw failure,
    );
  }

  Future<void> refresh() async {
    state = const AsyncLoading<List<GithubRepo>>().copyWithPrevious(state);
    state = await AsyncValue.guard(_load);
  }

  /// Optimistically updates the in-memory list, then persists the
  /// change - keeps the Favorites screen feeling instant.
  Future<void> toggle(GithubRepo repo) async {
    final ToggleFavoriteUseCase useCase = ref.read(toggleFavoriteUseCaseProvider);

    final List<GithubRepo> current = state.valueOrNull ?? [];
    final bool wasFavorite = current.any((r) => r.id == repo.id);
    state = AsyncData(
      wasFavorite
          ? current.where((r) => r.id != repo.id).toList()
          : [repo.copyWith(isFavorite: true), ...current],
    );

    final result = await useCase(repo);
    result.when(
      success: (_) {},
      failure: (failure) {
        // Roll back on failure so the UI reflects the true persisted state.
        state = AsyncData(current);
      },
    );
  }
}

final AsyncNotifierProvider<FavoritesNotifier, List<GithubRepo>> favoritesNotifierProvider =
    AsyncNotifierProvider<FavoritesNotifier, List<GithubRepo>>(FavoritesNotifier.new);

/// Lets any widget (e.g. a repo card's favorite icon) check favorite
/// status for one specific repo id without depending on the whole
/// list. A textbook use of `Provider.family`: the `int` argument scopes
/// a cheap, memoized derived provider per repository id.
final ProviderFamily<bool, int> isRepoFavoriteProvider =
    Provider.family<bool, int>((ref, repoId) {
  final AsyncValue<List<GithubRepo>> favorites = ref.watch(favoritesNotifierProvider);
  return favorites.valueOrNull?.any((r) => r.id == repoId) ?? false;
});
