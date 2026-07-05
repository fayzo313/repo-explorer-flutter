import '../../../../core/utils/result.dart';
import '../entities/github_repo.dart';
import '../repositories/repo_repository.dart';

/// Encapsulates the single business action "search GitHub repositories".
///
/// Use cases exist even though this one is a thin pass-through, because
/// (a) it gives every business action one obvious, testable, named entry
/// point, and (b) it's the natural place to add logic later (e.g. input
/// validation, analytics) without touching the repository or the UI.
class SearchRepositoriesUseCase {
  const SearchRepositoriesUseCase(this._repository);

  final RepoRepository _repository;

  Future<Result<List<GithubRepo>>> call({
    required String query,
    int page = 1,
  }) {
    final String effectiveQuery = query.trim().isEmpty
        ? 'stars:>10000' // discovery mode - see ApiConstants.defaultDiscoveryQuery
        : query.trim();
    return _repository.searchRepositories(query: effectiveQuery, page: page);
  }
}
