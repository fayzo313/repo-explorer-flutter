// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'repo_search_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RepoSearchState {
  String get query => throw _privateConstructorUsedError;
  List<GithubRepo> get results => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isLoadingMore => throw _privateConstructorUsedError;
  bool get isOffline => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Create a copy of RepoSearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RepoSearchStateCopyWith<RepoSearchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepoSearchStateCopyWith<$Res> {
  factory $RepoSearchStateCopyWith(
          RepoSearchState value, $Res Function(RepoSearchState) then) =
      _$RepoSearchStateCopyWithImpl<$Res, RepoSearchState>;
  @useResult
  $Res call(
      {String query,
      List<GithubRepo> results,
      bool isLoading,
      bool isLoadingMore,
      bool isOffline,
      String? errorMessage});
}

/// @nodoc
class _$RepoSearchStateCopyWithImpl<$Res, $Val extends RepoSearchState>
    implements $RepoSearchStateCopyWith<$Res> {
  _$RepoSearchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RepoSearchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
    Object? results = null,
    Object? isLoading = null,
    Object? isLoadingMore = null,
    Object? isOffline = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<GithubRepo>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingMore: null == isLoadingMore
          ? _value.isLoadingMore
          : isLoadingMore // ignore: cast_nullable_to_non_nullable
              as bool,
      isOffline: null == isOffline
          ? _value.isOffline
          : isOffline // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RepoSearchStateImplCopyWith<$Res>
    implements $RepoSearchStateCopyWith<$Res> {
  factory _$$RepoSearchStateImplCopyWith(_$RepoSearchStateImpl value,
          $Res Function(_$RepoSearchStateImpl) then) =
      __$$RepoSearchStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String query,
      List<GithubRepo> results,
      bool isLoading,
      bool isLoadingMore,
      bool isOffline,
      String? errorMessage});
}

/// @nodoc
class __$$RepoSearchStateImplCopyWithImpl<$Res>
    extends _$RepoSearchStateCopyWithImpl<$Res, _$RepoSearchStateImpl>
    implements _$$RepoSearchStateImplCopyWith<$Res> {
  __$$RepoSearchStateImplCopyWithImpl(
      _$RepoSearchStateImpl _value, $Res Function(_$RepoSearchStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of RepoSearchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
    Object? results = null,
    Object? isLoading = null,
    Object? isLoadingMore = null,
    Object? isOffline = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$RepoSearchStateImpl(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<GithubRepo>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingMore: null == isLoadingMore
          ? _value.isLoadingMore
          : isLoadingMore // ignore: cast_nullable_to_non_nullable
              as bool,
      isOffline: null == isOffline
          ? _value.isOffline
          : isOffline // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$RepoSearchStateImpl extends _RepoSearchState {
  const _$RepoSearchStateImpl(
      {this.query = '',
      final List<GithubRepo> results = const [],
      this.isLoading = false,
      this.isLoadingMore = false,
      this.isOffline = false,
      this.errorMessage})
      : _results = results,
        super._();

  @override
  @JsonKey()
  final String query;
  final List<GithubRepo> _results;
  @override
  @JsonKey()
  List<GithubRepo> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isLoadingMore;
  @override
  @JsonKey()
  final bool isOffline;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'RepoSearchState(query: $query, results: $results, isLoading: $isLoading, isLoadingMore: $isLoadingMore, isOffline: $isOffline, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RepoSearchStateImpl &&
            (identical(other.query, query) || other.query == query) &&
            const DeepCollectionEquality().equals(other._results, _results) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isLoadingMore, isLoadingMore) ||
                other.isLoadingMore == isLoadingMore) &&
            (identical(other.isOffline, isOffline) ||
                other.isOffline == isOffline) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      query,
      const DeepCollectionEquality().hash(_results),
      isLoading,
      isLoadingMore,
      isOffline,
      errorMessage);

  /// Create a copy of RepoSearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RepoSearchStateImplCopyWith<_$RepoSearchStateImpl> get copyWith =>
      __$$RepoSearchStateImplCopyWithImpl<_$RepoSearchStateImpl>(
          this, _$identity);
}

abstract class _RepoSearchState extends RepoSearchState {
  const factory _RepoSearchState(
      {final String query,
      final List<GithubRepo> results,
      final bool isLoading,
      final bool isLoadingMore,
      final bool isOffline,
      final String? errorMessage}) = _$RepoSearchStateImpl;
  const _RepoSearchState._() : super._();

  @override
  String get query;
  @override
  List<GithubRepo> get results;
  @override
  bool get isLoading;
  @override
  bool get isLoadingMore;
  @override
  bool get isOffline;
  @override
  String? get errorMessage;

  /// Create a copy of RepoSearchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RepoSearchStateImplCopyWith<_$RepoSearchStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
