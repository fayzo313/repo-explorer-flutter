import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../constants/api_constants.dart';

/// Thin factory around [Dio] so base URL / headers / interceptors are
/// configured in exactly one place.
class DioClient {
  static Dio create() {
    final String baseUrl = dotenv.env['GITHUB_BASE_URL'] ?? 'https://api.github.com';
    final String token = dotenv.env['GITHUB_TOKEN'] ?? '';

    final Dio dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: ApiConstants.connectTimeout,
        receiveTimeout: ApiConstants.receiveTimeout,
        headers: {
          'Accept': 'application/vnd.github+json',
          if (token.isNotEmpty) 'Authorization': 'Bearer $token',
        },
      ),
    );

    dio.interceptors.add(
      LogInterceptor(
        requestBody: false,
        responseBody: false,
        logPrint: (_) {}, // swap for a real logger in production
      ),
    );

    return dio;
  }
}
