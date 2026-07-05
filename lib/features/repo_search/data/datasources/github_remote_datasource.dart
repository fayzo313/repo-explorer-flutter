import 'package:dio/dio.dart';

import '../../../../core/constants/api_constants.dart';
import '../../../../core/error/exceptions.dart';
import '../models/github_repo_model.dart';

/// Talks to the real GitHub REST API. Only ever throws [AppException]
/// subtypes - never lets a raw [DioException] leak into the repository.
abstract interface class GithubRemoteDataSource {
  Future<List<GithubRepoModel>> searchRepositories({
    required String query,
    required int page,
  });
}

class GithubRemoteDataSourceImpl implements GithubRemoteDataSource {
  const GithubRemoteDataSourceImpl(this._dio);

  final Dio _dio;

  @override
  Future<List<GithubRepoModel>> searchRepositories({
    required String query,
    required int page,
  }) async {
    try {
      final Response<Map<String, dynamic>> response = await _dio.get(
        ApiConstants.searchRepositoriesPath,
        queryParameters: {
          'q': query,
          'sort': ApiConstants.sortByStars,
          'order': ApiConstants.orderDescending,
          'per_page': ApiConstants.defaultPerPage,
          'page': page,
        },
      );

      final GithubSearchResponseModel parsed =
          GithubSearchResponseModel.fromJson(response.data!);
      return parsed.items;
    } on DioException catch (e) {
      throw _mapDioException(e);
    }
  }

  AppException _mapDioException(DioException e) {
    if (e.type == DioExceptionType.connectionError ||
        e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout) {
      return const NetworkException();
    }

    final int? status = e.response?.statusCode;
    if (status == 403 || status == 429) {
      return const RateLimitException();
    }
    if (status == 404) {
      return const NotFoundException();
    }
    return const ServerException();
  }
}
