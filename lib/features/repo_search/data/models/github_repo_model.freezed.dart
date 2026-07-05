// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'github_repo_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GithubRepoModel _$GithubRepoModelFromJson(Map<String, dynamic> json) {
  return _GithubRepoModel.fromJson(json);
}

/// @nodoc
mixin _$GithubRepoModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'full_name')
  String get fullName => throw _privateConstructorUsedError;
  GithubOwnerModel get owner => throw _privateConstructorUsedError;
  @JsonKey(name: 'stargazers_count')
  int get stars => throw _privateConstructorUsedError;
  @JsonKey(name: 'forks_count')
  int get forks => throw _privateConstructorUsedError;
  @JsonKey(name: 'html_url')
  String get htmlUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get language => throw _privateConstructorUsedError;

  /// Serializes this GithubRepoModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GithubRepoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GithubRepoModelCopyWith<GithubRepoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GithubRepoModelCopyWith<$Res> {
  factory $GithubRepoModelCopyWith(
          GithubRepoModel value, $Res Function(GithubRepoModel) then) =
      _$GithubRepoModelCopyWithImpl<$Res, GithubRepoModel>;
  @useResult
  $Res call(
      {int id,
      String name,
      @JsonKey(name: 'full_name') String fullName,
      GithubOwnerModel owner,
      @JsonKey(name: 'stargazers_count') int stars,
      @JsonKey(name: 'forks_count') int forks,
      @JsonKey(name: 'html_url') String htmlUrl,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      String? description,
      String? language});

  $GithubOwnerModelCopyWith<$Res> get owner;
}

/// @nodoc
class _$GithubRepoModelCopyWithImpl<$Res, $Val extends GithubRepoModel>
    implements $GithubRepoModelCopyWith<$Res> {
  _$GithubRepoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GithubRepoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? fullName = null,
    Object? owner = null,
    Object? stars = null,
    Object? forks = null,
    Object? htmlUrl = null,
    Object? updatedAt = null,
    Object? description = freezed,
    Object? language = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      owner: null == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as GithubOwnerModel,
      stars: null == stars
          ? _value.stars
          : stars // ignore: cast_nullable_to_non_nullable
              as int,
      forks: null == forks
          ? _value.forks
          : forks // ignore: cast_nullable_to_non_nullable
              as int,
      htmlUrl: null == htmlUrl
          ? _value.htmlUrl
          : htmlUrl // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of GithubRepoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GithubOwnerModelCopyWith<$Res> get owner {
    return $GithubOwnerModelCopyWith<$Res>(_value.owner, (value) {
      return _then(_value.copyWith(owner: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GithubRepoModelImplCopyWith<$Res>
    implements $GithubRepoModelCopyWith<$Res> {
  factory _$$GithubRepoModelImplCopyWith(_$GithubRepoModelImpl value,
          $Res Function(_$GithubRepoModelImpl) then) =
      __$$GithubRepoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      @JsonKey(name: 'full_name') String fullName,
      GithubOwnerModel owner,
      @JsonKey(name: 'stargazers_count') int stars,
      @JsonKey(name: 'forks_count') int forks,
      @JsonKey(name: 'html_url') String htmlUrl,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      String? description,
      String? language});

  @override
  $GithubOwnerModelCopyWith<$Res> get owner;
}

/// @nodoc
class __$$GithubRepoModelImplCopyWithImpl<$Res>
    extends _$GithubRepoModelCopyWithImpl<$Res, _$GithubRepoModelImpl>
    implements _$$GithubRepoModelImplCopyWith<$Res> {
  __$$GithubRepoModelImplCopyWithImpl(
      _$GithubRepoModelImpl _value, $Res Function(_$GithubRepoModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of GithubRepoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? fullName = null,
    Object? owner = null,
    Object? stars = null,
    Object? forks = null,
    Object? htmlUrl = null,
    Object? updatedAt = null,
    Object? description = freezed,
    Object? language = freezed,
  }) {
    return _then(_$GithubRepoModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      owner: null == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as GithubOwnerModel,
      stars: null == stars
          ? _value.stars
          : stars // ignore: cast_nullable_to_non_nullable
              as int,
      forks: null == forks
          ? _value.forks
          : forks // ignore: cast_nullable_to_non_nullable
              as int,
      htmlUrl: null == htmlUrl
          ? _value.htmlUrl
          : htmlUrl // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GithubRepoModelImpl implements _GithubRepoModel {
  const _$GithubRepoModelImpl(
      {required this.id,
      required this.name,
      @JsonKey(name: 'full_name') required this.fullName,
      required this.owner,
      @JsonKey(name: 'stargazers_count') required this.stars,
      @JsonKey(name: 'forks_count') required this.forks,
      @JsonKey(name: 'html_url') required this.htmlUrl,
      @JsonKey(name: 'updated_at') required this.updatedAt,
      this.description,
      this.language});

  factory _$GithubRepoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GithubRepoModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  @JsonKey(name: 'full_name')
  final String fullName;
  @override
  final GithubOwnerModel owner;
  @override
  @JsonKey(name: 'stargazers_count')
  final int stars;
  @override
  @JsonKey(name: 'forks_count')
  final int forks;
  @override
  @JsonKey(name: 'html_url')
  final String htmlUrl;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;
  @override
  final String? description;
  @override
  final String? language;

  @override
  String toString() {
    return 'GithubRepoModel(id: $id, name: $name, fullName: $fullName, owner: $owner, stars: $stars, forks: $forks, htmlUrl: $htmlUrl, updatedAt: $updatedAt, description: $description, language: $language)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GithubRepoModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.owner, owner) || other.owner == owner) &&
            (identical(other.stars, stars) || other.stars == stars) &&
            (identical(other.forks, forks) || other.forks == forks) &&
            (identical(other.htmlUrl, htmlUrl) || other.htmlUrl == htmlUrl) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.language, language) ||
                other.language == language));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, fullName, owner, stars,
      forks, htmlUrl, updatedAt, description, language);

  /// Create a copy of GithubRepoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GithubRepoModelImplCopyWith<_$GithubRepoModelImpl> get copyWith =>
      __$$GithubRepoModelImplCopyWithImpl<_$GithubRepoModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GithubRepoModelImplToJson(
      this,
    );
  }
}

abstract class _GithubRepoModel implements GithubRepoModel {
  const factory _GithubRepoModel(
      {required final int id,
      required final String name,
      @JsonKey(name: 'full_name') required final String fullName,
      required final GithubOwnerModel owner,
      @JsonKey(name: 'stargazers_count') required final int stars,
      @JsonKey(name: 'forks_count') required final int forks,
      @JsonKey(name: 'html_url') required final String htmlUrl,
      @JsonKey(name: 'updated_at') required final DateTime updatedAt,
      final String? description,
      final String? language}) = _$GithubRepoModelImpl;

  factory _GithubRepoModel.fromJson(Map<String, dynamic> json) =
      _$GithubRepoModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(name: 'full_name')
  String get fullName;
  @override
  GithubOwnerModel get owner;
  @override
  @JsonKey(name: 'stargazers_count')
  int get stars;
  @override
  @JsonKey(name: 'forks_count')
  int get forks;
  @override
  @JsonKey(name: 'html_url')
  String get htmlUrl;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;
  @override
  String? get description;
  @override
  String? get language;

  /// Create a copy of GithubRepoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GithubRepoModelImplCopyWith<_$GithubRepoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GithubOwnerModel _$GithubOwnerModelFromJson(Map<String, dynamic> json) {
  return _GithubOwnerModel.fromJson(json);
}

/// @nodoc
mixin _$GithubOwnerModel {
  String get login => throw _privateConstructorUsedError;
  @JsonKey(name: 'avatar_url')
  String get avatarUrl => throw _privateConstructorUsedError;

  /// Serializes this GithubOwnerModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GithubOwnerModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GithubOwnerModelCopyWith<GithubOwnerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GithubOwnerModelCopyWith<$Res> {
  factory $GithubOwnerModelCopyWith(
          GithubOwnerModel value, $Res Function(GithubOwnerModel) then) =
      _$GithubOwnerModelCopyWithImpl<$Res, GithubOwnerModel>;
  @useResult
  $Res call({String login, @JsonKey(name: 'avatar_url') String avatarUrl});
}

/// @nodoc
class _$GithubOwnerModelCopyWithImpl<$Res, $Val extends GithubOwnerModel>
    implements $GithubOwnerModelCopyWith<$Res> {
  _$GithubOwnerModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GithubOwnerModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? login = null,
    Object? avatarUrl = null,
  }) {
    return _then(_value.copyWith(
      login: null == login
          ? _value.login
          : login // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: null == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GithubOwnerModelImplCopyWith<$Res>
    implements $GithubOwnerModelCopyWith<$Res> {
  factory _$$GithubOwnerModelImplCopyWith(_$GithubOwnerModelImpl value,
          $Res Function(_$GithubOwnerModelImpl) then) =
      __$$GithubOwnerModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String login, @JsonKey(name: 'avatar_url') String avatarUrl});
}

/// @nodoc
class __$$GithubOwnerModelImplCopyWithImpl<$Res>
    extends _$GithubOwnerModelCopyWithImpl<$Res, _$GithubOwnerModelImpl>
    implements _$$GithubOwnerModelImplCopyWith<$Res> {
  __$$GithubOwnerModelImplCopyWithImpl(_$GithubOwnerModelImpl _value,
      $Res Function(_$GithubOwnerModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of GithubOwnerModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? login = null,
    Object? avatarUrl = null,
  }) {
    return _then(_$GithubOwnerModelImpl(
      login: null == login
          ? _value.login
          : login // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: null == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GithubOwnerModelImpl implements _GithubOwnerModel {
  const _$GithubOwnerModelImpl(
      {required this.login,
      @JsonKey(name: 'avatar_url') required this.avatarUrl});

  factory _$GithubOwnerModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GithubOwnerModelImplFromJson(json);

  @override
  final String login;
  @override
  @JsonKey(name: 'avatar_url')
  final String avatarUrl;

  @override
  String toString() {
    return 'GithubOwnerModel(login: $login, avatarUrl: $avatarUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GithubOwnerModelImpl &&
            (identical(other.login, login) || other.login == login) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, login, avatarUrl);

  /// Create a copy of GithubOwnerModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GithubOwnerModelImplCopyWith<_$GithubOwnerModelImpl> get copyWith =>
      __$$GithubOwnerModelImplCopyWithImpl<_$GithubOwnerModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GithubOwnerModelImplToJson(
      this,
    );
  }
}

abstract class _GithubOwnerModel implements GithubOwnerModel {
  const factory _GithubOwnerModel(
          {required final String login,
          @JsonKey(name: 'avatar_url') required final String avatarUrl}) =
      _$GithubOwnerModelImpl;

  factory _GithubOwnerModel.fromJson(Map<String, dynamic> json) =
      _$GithubOwnerModelImpl.fromJson;

  @override
  String get login;
  @override
  @JsonKey(name: 'avatar_url')
  String get avatarUrl;

  /// Create a copy of GithubOwnerModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GithubOwnerModelImplCopyWith<_$GithubOwnerModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GithubSearchResponseModel _$GithubSearchResponseModelFromJson(
    Map<String, dynamic> json) {
  return _GithubSearchResponseModel.fromJson(json);
}

/// @nodoc
mixin _$GithubSearchResponseModel {
  @JsonKey(name: 'total_count')
  int get totalCount => throw _privateConstructorUsedError;
  List<GithubRepoModel> get items => throw _privateConstructorUsedError;

  /// Serializes this GithubSearchResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GithubSearchResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GithubSearchResponseModelCopyWith<GithubSearchResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GithubSearchResponseModelCopyWith<$Res> {
  factory $GithubSearchResponseModelCopyWith(GithubSearchResponseModel value,
          $Res Function(GithubSearchResponseModel) then) =
      _$GithubSearchResponseModelCopyWithImpl<$Res, GithubSearchResponseModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'total_count') int totalCount,
      List<GithubRepoModel> items});
}

/// @nodoc
class _$GithubSearchResponseModelCopyWithImpl<$Res,
        $Val extends GithubSearchResponseModel>
    implements $GithubSearchResponseModelCopyWith<$Res> {
  _$GithubSearchResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GithubSearchResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCount = null,
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<GithubRepoModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GithubSearchResponseModelImplCopyWith<$Res>
    implements $GithubSearchResponseModelCopyWith<$Res> {
  factory _$$GithubSearchResponseModelImplCopyWith(
          _$GithubSearchResponseModelImpl value,
          $Res Function(_$GithubSearchResponseModelImpl) then) =
      __$$GithubSearchResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'total_count') int totalCount,
      List<GithubRepoModel> items});
}

/// @nodoc
class __$$GithubSearchResponseModelImplCopyWithImpl<$Res>
    extends _$GithubSearchResponseModelCopyWithImpl<$Res,
        _$GithubSearchResponseModelImpl>
    implements _$$GithubSearchResponseModelImplCopyWith<$Res> {
  __$$GithubSearchResponseModelImplCopyWithImpl(
      _$GithubSearchResponseModelImpl _value,
      $Res Function(_$GithubSearchResponseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of GithubSearchResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCount = null,
    Object? items = null,
  }) {
    return _then(_$GithubSearchResponseModelImpl(
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<GithubRepoModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GithubSearchResponseModelImpl implements _GithubSearchResponseModel {
  const _$GithubSearchResponseModelImpl(
      {@JsonKey(name: 'total_count') required this.totalCount,
      required final List<GithubRepoModel> items})
      : _items = items;

  factory _$GithubSearchResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GithubSearchResponseModelImplFromJson(json);

  @override
  @JsonKey(name: 'total_count')
  final int totalCount;
  final List<GithubRepoModel> _items;
  @override
  List<GithubRepoModel> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'GithubSearchResponseModel(totalCount: $totalCount, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GithubSearchResponseModelImpl &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, totalCount, const DeepCollectionEquality().hash(_items));

  /// Create a copy of GithubSearchResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GithubSearchResponseModelImplCopyWith<_$GithubSearchResponseModelImpl>
      get copyWith => __$$GithubSearchResponseModelImplCopyWithImpl<
          _$GithubSearchResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GithubSearchResponseModelImplToJson(
      this,
    );
  }
}

abstract class _GithubSearchResponseModel implements GithubSearchResponseModel {
  const factory _GithubSearchResponseModel(
          {@JsonKey(name: 'total_count') required final int totalCount,
          required final List<GithubRepoModel> items}) =
      _$GithubSearchResponseModelImpl;

  factory _GithubSearchResponseModel.fromJson(Map<String, dynamic> json) =
      _$GithubSearchResponseModelImpl.fromJson;

  @override
  @JsonKey(name: 'total_count')
  int get totalCount;
  @override
  List<GithubRepoModel> get items;

  /// Create a copy of GithubSearchResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GithubSearchResponseModelImplCopyWith<_$GithubSearchResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
