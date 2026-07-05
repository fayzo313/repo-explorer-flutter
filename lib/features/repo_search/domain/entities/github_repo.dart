import 'package:freezed_annotation/freezed_annotation.dart';

part 'github_repo.freezed.dart';

/// Pure domain entity - what the *app* cares about a GitHub repository,
/// independent of how the GitHub API happens to shape its JSON.
///
/// This is intentionally a separate class from `GithubRepoModel` (data
/// layer): the domain layer must never depend on `json_serializable` or
/// on GitHub's wire format, only on Dart types (Dependency Inversion).
@freezed
class GithubRepo with _$GithubRepo {
  const factory GithubRepo({
    required int id,
    required String name,
    required String fullName,
    required String ownerLogin,
    required String ownerAvatarUrl,
    required int stars,
    required int forks,
    required String htmlUrl,
    required DateTime updatedAt,
    String? description,
    String? language,
    @Default(false) bool isFavorite,
  }) = _GithubRepo;
}
