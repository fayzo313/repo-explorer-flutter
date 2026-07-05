import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/error/failures.dart';
import '../../../favorites/presentation/providers/favorites_provider.dart';
import '../../../repo_search/domain/entities/github_repo.dart';
import '../../../repo_search/presentation/providers/repo_search_notifier.dart';
import '../../../repo_search/presentation/providers/repo_search_state.dart';

/// Resolves the full [GithubRepo] for the Details screen given its id.
///
/// A `FutureProvider.family` is the right tool here: the Details screen
/// needs a single one-shot async value keyed by the repo id, with no
/// further mutation - exactly `FutureProvider`'s use case, as opposed
/// to `Notifier`/`AsyncNotifier` which are for state that changes over
/// the widget's lifetime.
///
/// Rather than a second network round trip, we look the repo up in
/// whatever list is already in memory (search results or favorites) -
/// it was already fully fetched to get here, so this keeps the demo
/// snappy and avoids burning extra GitHub API rate-limit quota.
final FutureProviderFamily<GithubRepo, int> repoDetailsProvider =
    FutureProvider.family<GithubRepo, int>((ref, repoId) async {
  final RepoSearchState searchState = ref.watch(repoSearchNotifierProvider);
  final GithubRepo? fromSearch =
      _findById(searchState.results, repoId);
  if (fromSearch != null) return fromSearch;

  final AsyncValue<List<GithubRepo>> favoritesState =
      ref.watch(favoritesNotifierProvider);
  final GithubRepo? fromFavorites =
      _findById(favoritesState.valueOrNull ?? const [], repoId);
  if (fromFavorites != null) return fromFavorites;

  throw const NotFoundFailure('Repository details are no longer available.');
});

GithubRepo? _findById(List<GithubRepo> repos, int id) {
  for (final GithubRepo repo in repos) {
    if (repo.id == id) return repo;
  }
  return null;
}
