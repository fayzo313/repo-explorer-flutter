import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/github_repo.dart';

part 'github_repo_model.freezed.dart';
part 'github_repo_model.g.dart';

/// Data-layer model - mirrors the GitHub REST API's repository JSON
/// shape exactly (snake_case field names via [JsonKey]).
///
/// Kept separate from [GithubRepo] (the domain entity) so a GitHub API
/// change only ever requires editing this file + [toEntity], never the
/// domain or presentation layers.
@freezed
class GithubRepoModel with _$GithubRepoModel {
  const factory GithubRepoModel({
    required int id,
    required String name,
    @JsonKey(name: 'full_name') required String fullName,
    required GithubOwnerModel owner,
    @JsonKey(name: 'stargazers_count') required int stars,
    @JsonKey(name: 'forks_count') required int forks,
    @JsonKey(name: 'html_url') required String htmlUrl,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    String? description,
    String? language,
  }) = _GithubRepoModel;

  factory GithubRepoModel.fromJson(Map<String, dynamic> json) =>
      _$GithubRepoModelFromJson(json);
}

extension GithubRepoModelMapper on GithubRepoModel {
  /// Converts this wire-format model into the pure domain entity.
  GithubRepo toEntity({bool isFavorite = false}) {
    return GithubRepo(
      id: id,
      name: name,
      fullName: fullName,
      ownerLogin: owner.login,
      ownerAvatarUrl: owner.avatarUrl,
      stars: stars,
      forks: forks,
      htmlUrl: htmlUrl,
      updatedAt: updatedAt,
      description: description,
      language: language,
      isFavorite: isFavorite,
    );
  }
}

@freezed
class GithubOwnerModel with _$GithubOwnerModel {
  const factory GithubOwnerModel({
    required String login,
    @JsonKey(name: 'avatar_url') required String avatarUrl,
  }) = _GithubOwnerModel;

  factory GithubOwnerModel.fromJson(Map<String, dynamic> json) =>
      _$GithubOwnerModelFromJson(json);
}

/// Wrapper for GitHub's `/search/repositories` response envelope:
/// `{ total_count, incomplete_results, items: [...] }`.
@freezed
class GithubSearchResponseModel with _$GithubSearchResponseModel {
  const factory GithubSearchResponseModel({
    @JsonKey(name: 'total_count') required int totalCount,
    required List<GithubRepoModel> items,
  }) = _GithubSearchResponseModel;

  factory GithubSearchResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GithubSearchResponseModelFromJson(json);
}
