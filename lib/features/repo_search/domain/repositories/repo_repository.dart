import '../../../../core/utils/result.dart';
import '../entities/github_repo.dart';

/// The **contract** the domain layer depends on. Use cases and Riverpod
/// notifiers only ever see this interface, never `RepoRepositoryImpl` -
/// that's the Dependency Inversion / Repository Pattern requirement:
/// the data layer depends on this abstraction, not the other way round.
abstract interface class RepoRepository {
  /// Searches GitHub for repositories matching [query].
  ///
  /// Behavior: tries the network first; on success it refreshes the
  /// cache and returns fresh data. On network failure it falls back to
  /// whatever is cached for this exact [query], if anything.
  Future<Result<List<GithubRepo>>> searchRepositories({
    required String query,
    int page = 1,
  });

  Future<Result<List<GithubRepo>>> getFavorites();

  Future<Result<void>> toggleFavorite(GithubRepo repo);

  Future<Result<bool>> isFavorite(int repoId);
}
