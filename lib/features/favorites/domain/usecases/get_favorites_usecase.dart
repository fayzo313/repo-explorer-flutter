import '../../../../core/utils/result.dart';
import '../../../repo_search/domain/entities/github_repo.dart';
import '../../../repo_search/domain/repositories/repo_repository.dart';

/// Returns every repository the user has favorited, most-recent first.
class GetFavoritesUseCase {
  const GetFavoritesUseCase(this._repository);

  final RepoRepository _repository;

  Future<Result<List<GithubRepo>>> call() {
    return _repository.getFavorites();
  }
}
