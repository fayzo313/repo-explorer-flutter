import '../../../../core/utils/result.dart';
import '../../../repo_search/domain/entities/github_repo.dart';
import '../../../repo_search/domain/repositories/repo_repository.dart';

/// Adds [repo] to favorites if it isn't one yet, otherwise removes it.
///
/// Lives in the `favorites` feature (not `repo_search`) even though it
/// operates on `RepoRepository`, because "favoriting" is a distinct
/// business capability from "searching" - this is what feature-first
/// organization is for: group by capability, not by data type.
class ToggleFavoriteUseCase {
  const ToggleFavoriteUseCase(this._repository);

  final RepoRepository _repository;

  Future<Result<void>> call(GithubRepo repo) {
    return _repository.toggleFavorite(repo);
  }
}
