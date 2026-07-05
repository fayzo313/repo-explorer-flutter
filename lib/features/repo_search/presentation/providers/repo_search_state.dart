import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/github_repo.dart';

part 'repo_search_state.freezed.dart';

/// Everything the Home screen needs to render, in one immutable object.
///
/// Modeling state explicitly (instead of juggling separate booleans for
/// loading/error/data) removes whole classes of "impossible states"
/// (e.g. loading=true AND error!=null at once) - a key win of using
/// Freezed unions/state classes with Riverpod.
@freezed
class RepoSearchState with _$RepoSearchState {
  const factory RepoSearchState({
    @Default('') String query,
    @Default([]) List<GithubRepo> results,
    @Default(false) bool isLoading,
    @Default(false) bool isLoadingMore,
    @Default(false) bool isOffline,
    String? errorMessage,
  }) = _RepoSearchState;

  const RepoSearchState._();

  bool get isEmpty => !isLoading && errorMessage == null && results.isEmpty;
}
