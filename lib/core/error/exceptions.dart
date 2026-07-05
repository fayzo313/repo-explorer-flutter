/// Exceptions are thrown by the **data layer** (data sources) when
/// something concrete goes wrong (a bad HTTP status, a DB write error,
/// etc). They carry technical detail.
///
/// The repository layer catches these and converts them into
/// user-facing [Failure]s (see failures.dart) - this is what lets the
/// domain/presentation layers stay free of `dio`/`drift` types.
sealed class AppException implements Exception {
  const AppException(this.message);

  final String message;

  @override
  String toString() => message;
}

class ServerException extends AppException {
  const ServerException([super.message = 'Server returned an error.']);
}

class NetworkException extends AppException {
  const NetworkException([super.message = 'No internet connection.']);
}

class CacheException extends AppException {
  const CacheException([super.message = 'Failed to read local cache.']);
}

class RateLimitException extends AppException {
  const RateLimitException([
    super.message = 'GitHub API rate limit exceeded. Try again shortly.',
  ]);
}

class NotFoundException extends AppException {
  const NotFoundException([super.message = 'Resource not found.']);
}
