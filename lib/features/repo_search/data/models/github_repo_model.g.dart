// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_repo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GithubRepoModelImpl _$$GithubRepoModelImplFromJson(
        Map<String, dynamic> json) =>
    _$GithubRepoModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      fullName: json['full_name'] as String,
      owner: GithubOwnerModel.fromJson(json['owner'] as Map<String, dynamic>),
      stars: (json['stargazers_count'] as num).toInt(),
      forks: (json['forks_count'] as num).toInt(),
      htmlUrl: json['html_url'] as String,
      updatedAt: DateTime.parse(json['updated_at'] as String),
      description: json['description'] as String?,
      language: json['language'] as String?,
    );

Map<String, dynamic> _$$GithubRepoModelImplToJson(
        _$GithubRepoModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'full_name': instance.fullName,
      'owner': instance.owner,
      'stargazers_count': instance.stars,
      'forks_count': instance.forks,
      'html_url': instance.htmlUrl,
      'updated_at': instance.updatedAt.toIso8601String(),
      'description': instance.description,
      'language': instance.language,
    };

_$GithubOwnerModelImpl _$$GithubOwnerModelImplFromJson(
        Map<String, dynamic> json) =>
    _$GithubOwnerModelImpl(
      login: json['login'] as String,
      avatarUrl: json['avatar_url'] as String,
    );

Map<String, dynamic> _$$GithubOwnerModelImplToJson(
        _$GithubOwnerModelImpl instance) =>
    <String, dynamic>{
      'login': instance.login,
      'avatar_url': instance.avatarUrl,
    };

_$GithubSearchResponseModelImpl _$$GithubSearchResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$GithubSearchResponseModelImpl(
      totalCount: (json['total_count'] as num).toInt(),
      items: (json['items'] as List<dynamic>)
          .map((e) => GithubRepoModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GithubSearchResponseModelImplToJson(
        _$GithubSearchResponseModelImpl instance) =>
    <String, dynamic>{
      'total_count': instance.totalCount,
      'items': instance.items,
    };
