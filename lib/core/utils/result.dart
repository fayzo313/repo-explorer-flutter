import 'package:github_repo_explorer/core/error/failures.dart';

/// A tiny, dependency-free "Either"-style result type.
///
/// Repository methods return `Future<Result<T>>` instead of throwing, so
/// use cases and providers can pattern-match on success/failure without
/// try/catch everywhere and without depending on a third-party fpdart
/// package (keeps the dependency surface small and interview-explainable).
sealed class Result<T> {
  const Result();

  const factory Result.success(T data) = Success<T>;

  const factory Result.failure(Failure failure) = Failure_<T>;

  R when<R>({
    required R Function(T data) success,
    required R Function(Failure failure) failure,
  }) {
    final Result<T> self = this;
    if (self is Success<T>) return success(self.data);
    if (self is Failure_<T>) return failure(self.failure);
    throw StateError('Unreachable');
  }

  bool get isSuccess => this is Success<T>;
}

class Success<T> extends Result<T> {
  const Success(this.data);

  final T data;
}

class Failure_<T> extends Result<T> {
  const Failure_(this.failure);

  final Failure failure;
}
