import 'package:flutter/foundation.dart';

/// User-facing, layer-agnostic representation of "something went wrong".
///
/// The presentation layer only ever needs to know about [Failure], never
/// about Dio, Drift, or HTTP status codes - that boundary is what makes
/// the domain layer independent of frameworks (Clean Architecture / DIP).
@immutable
sealed class Failure {
  const Failure(this.message);

  final String message;

  @override
  bool operator ==(Object other) =>
      other is Failure && other.runtimeType == runtimeType && other.message == message;

  @override
  int get hashCode => Object.hash(runtimeType, message);
}

class ServerFailure extends Failure {
  const ServerFailure([super.message = 'Something went wrong on the server.']);
}

class NetworkFailure extends Failure {
  const NetworkFailure([
    super.message = 'No internet connection. Showing cached results if available.',
  ]);
}

class CacheFailure extends Failure {
  const CacheFailure([super.message = 'Could not read saved data.']);
}

class RateLimitFailure extends Failure {
  const RateLimitFailure([
    super.message = 'GitHub rate limit reached. Please try again in a minute.',
  ]);
}

class NotFoundFailure extends Failure {
  const NotFoundFailure([super.message = 'No results found.']);
}

class UnknownFailure extends Failure {
  const UnknownFailure([super.message = 'An unexpected error occurred.']);
}
