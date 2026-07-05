// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $CachedRepositoriesTable extends CachedRepositories
    with TableInfo<$CachedRepositoriesTable, CachedRepository> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CachedRepositoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _searchQueryMeta =
      const VerificationMeta('searchQuery');
  @override
  late final GeneratedColumn<String> searchQuery = GeneratedColumn<String>(
      'search_query', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _fullNameMeta =
      const VerificationMeta('fullName');
  @override
  late final GeneratedColumn<String> fullName = GeneratedColumn<String>(
      'full_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _ownerLoginMeta =
      const VerificationMeta('ownerLogin');
  @override
  late final GeneratedColumn<String> ownerLogin = GeneratedColumn<String>(
      'owner_login', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _ownerAvatarUrlMeta =
      const VerificationMeta('ownerAvatarUrl');
  @override
  late final GeneratedColumn<String> ownerAvatarUrl = GeneratedColumn<String>(
      'owner_avatar_url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _starsMeta = const VerificationMeta('stars');
  @override
  late final GeneratedColumn<int> stars = GeneratedColumn<int>(
      'stars', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _forksMeta = const VerificationMeta('forks');
  @override
  late final GeneratedColumn<int> forks = GeneratedColumn<int>(
      'forks', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _languageMeta =
      const VerificationMeta('language');
  @override
  late final GeneratedColumn<String> language = GeneratedColumn<String>(
      'language', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _htmlUrlMeta =
      const VerificationMeta('htmlUrl');
  @override
  late final GeneratedColumn<String> htmlUrl = GeneratedColumn<String>(
      'html_url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _cachedAtMeta =
      const VerificationMeta('cachedAt');
  @override
  late final GeneratedColumn<DateTime> cachedAt = GeneratedColumn<DateTime>(
      'cached_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        searchQuery,
        name,
        fullName,
        ownerLogin,
        ownerAvatarUrl,
        description,
        stars,
        forks,
        language,
        htmlUrl,
        updatedAt,
        cachedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cached_repositories';
  @override
  VerificationContext validateIntegrity(Insertable<CachedRepository> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('search_query')) {
      context.handle(
          _searchQueryMeta,
          searchQuery.isAcceptableOrUnknown(
              data['search_query']!, _searchQueryMeta));
    } else if (isInserting) {
      context.missing(_searchQueryMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('full_name')) {
      context.handle(_fullNameMeta,
          fullName.isAcceptableOrUnknown(data['full_name']!, _fullNameMeta));
    } else if (isInserting) {
      context.missing(_fullNameMeta);
    }
    if (data.containsKey('owner_login')) {
      context.handle(
          _ownerLoginMeta,
          ownerLogin.isAcceptableOrUnknown(
              data['owner_login']!, _ownerLoginMeta));
    } else if (isInserting) {
      context.missing(_ownerLoginMeta);
    }
    if (data.containsKey('owner_avatar_url')) {
      context.handle(
          _ownerAvatarUrlMeta,
          ownerAvatarUrl.isAcceptableOrUnknown(
              data['owner_avatar_url']!, _ownerAvatarUrlMeta));
    } else if (isInserting) {
      context.missing(_ownerAvatarUrlMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('stars')) {
      context.handle(
          _starsMeta, stars.isAcceptableOrUnknown(data['stars']!, _starsMeta));
    } else if (isInserting) {
      context.missing(_starsMeta);
    }
    if (data.containsKey('forks')) {
      context.handle(
          _forksMeta, forks.isAcceptableOrUnknown(data['forks']!, _forksMeta));
    } else if (isInserting) {
      context.missing(_forksMeta);
    }
    if (data.containsKey('language')) {
      context.handle(_languageMeta,
          language.isAcceptableOrUnknown(data['language']!, _languageMeta));
    }
    if (data.containsKey('html_url')) {
      context.handle(_htmlUrlMeta,
          htmlUrl.isAcceptableOrUnknown(data['html_url']!, _htmlUrlMeta));
    } else if (isInserting) {
      context.missing(_htmlUrlMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('cached_at')) {
      context.handle(_cachedAtMeta,
          cachedAt.isAcceptableOrUnknown(data['cached_at']!, _cachedAtMeta));
    } else if (isInserting) {
      context.missing(_cachedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id, searchQuery};
  @override
  CachedRepository map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CachedRepository(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      searchQuery: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}search_query'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      fullName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}full_name'])!,
      ownerLogin: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}owner_login'])!,
      ownerAvatarUrl: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}owner_avatar_url'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      stars: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}stars'])!,
      forks: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}forks'])!,
      language: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}language']),
      htmlUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}html_url'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      cachedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}cached_at'])!,
    );
  }

  @override
  $CachedRepositoriesTable createAlias(String alias) {
    return $CachedRepositoriesTable(attachedDatabase, alias);
  }
}

class CachedRepository extends DataClass
    implements Insertable<CachedRepository> {
  final int id;
  final String searchQuery;
  final String name;
  final String fullName;
  final String ownerLogin;
  final String ownerAvatarUrl;
  final String? description;
  final int stars;
  final int forks;
  final String? language;
  final String htmlUrl;
  final DateTime updatedAt;
  final DateTime cachedAt;
  const CachedRepository(
      {required this.id,
      required this.searchQuery,
      required this.name,
      required this.fullName,
      required this.ownerLogin,
      required this.ownerAvatarUrl,
      this.description,
      required this.stars,
      required this.forks,
      this.language,
      required this.htmlUrl,
      required this.updatedAt,
      required this.cachedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['search_query'] = Variable<String>(searchQuery);
    map['name'] = Variable<String>(name);
    map['full_name'] = Variable<String>(fullName);
    map['owner_login'] = Variable<String>(ownerLogin);
    map['owner_avatar_url'] = Variable<String>(ownerAvatarUrl);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['stars'] = Variable<int>(stars);
    map['forks'] = Variable<int>(forks);
    if (!nullToAbsent || language != null) {
      map['language'] = Variable<String>(language);
    }
    map['html_url'] = Variable<String>(htmlUrl);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['cached_at'] = Variable<DateTime>(cachedAt);
    return map;
  }

  CachedRepositoriesCompanion toCompanion(bool nullToAbsent) {
    return CachedRepositoriesCompanion(
      id: Value(id),
      searchQuery: Value(searchQuery),
      name: Value(name),
      fullName: Value(fullName),
      ownerLogin: Value(ownerLogin),
      ownerAvatarUrl: Value(ownerAvatarUrl),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      stars: Value(stars),
      forks: Value(forks),
      language: language == null && nullToAbsent
          ? const Value.absent()
          : Value(language),
      htmlUrl: Value(htmlUrl),
      updatedAt: Value(updatedAt),
      cachedAt: Value(cachedAt),
    );
  }

  factory CachedRepository.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CachedRepository(
      id: serializer.fromJson<int>(json['id']),
      searchQuery: serializer.fromJson<String>(json['searchQuery']),
      name: serializer.fromJson<String>(json['name']),
      fullName: serializer.fromJson<String>(json['fullName']),
      ownerLogin: serializer.fromJson<String>(json['ownerLogin']),
      ownerAvatarUrl: serializer.fromJson<String>(json['ownerAvatarUrl']),
      description: serializer.fromJson<String?>(json['description']),
      stars: serializer.fromJson<int>(json['stars']),
      forks: serializer.fromJson<int>(json['forks']),
      language: serializer.fromJson<String?>(json['language']),
      htmlUrl: serializer.fromJson<String>(json['htmlUrl']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      cachedAt: serializer.fromJson<DateTime>(json['cachedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'searchQuery': serializer.toJson<String>(searchQuery),
      'name': serializer.toJson<String>(name),
      'fullName': serializer.toJson<String>(fullName),
      'ownerLogin': serializer.toJson<String>(ownerLogin),
      'ownerAvatarUrl': serializer.toJson<String>(ownerAvatarUrl),
      'description': serializer.toJson<String?>(description),
      'stars': serializer.toJson<int>(stars),
      'forks': serializer.toJson<int>(forks),
      'language': serializer.toJson<String?>(language),
      'htmlUrl': serializer.toJson<String>(htmlUrl),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'cachedAt': serializer.toJson<DateTime>(cachedAt),
    };
  }

  CachedRepository copyWith(
          {int? id,
          String? searchQuery,
          String? name,
          String? fullName,
          String? ownerLogin,
          String? ownerAvatarUrl,
          Value<String?> description = const Value.absent(),
          int? stars,
          int? forks,
          Value<String?> language = const Value.absent(),
          String? htmlUrl,
          DateTime? updatedAt,
          DateTime? cachedAt}) =>
      CachedRepository(
        id: id ?? this.id,
        searchQuery: searchQuery ?? this.searchQuery,
        name: name ?? this.name,
        fullName: fullName ?? this.fullName,
        ownerLogin: ownerLogin ?? this.ownerLogin,
        ownerAvatarUrl: ownerAvatarUrl ?? this.ownerAvatarUrl,
        description: description.present ? description.value : this.description,
        stars: stars ?? this.stars,
        forks: forks ?? this.forks,
        language: language.present ? language.value : this.language,
        htmlUrl: htmlUrl ?? this.htmlUrl,
        updatedAt: updatedAt ?? this.updatedAt,
        cachedAt: cachedAt ?? this.cachedAt,
      );
  CachedRepository copyWithCompanion(CachedRepositoriesCompanion data) {
    return CachedRepository(
      id: data.id.present ? data.id.value : this.id,
      searchQuery:
          data.searchQuery.present ? data.searchQuery.value : this.searchQuery,
      name: data.name.present ? data.name.value : this.name,
      fullName: data.fullName.present ? data.fullName.value : this.fullName,
      ownerLogin:
          data.ownerLogin.present ? data.ownerLogin.value : this.ownerLogin,
      ownerAvatarUrl: data.ownerAvatarUrl.present
          ? data.ownerAvatarUrl.value
          : this.ownerAvatarUrl,
      description:
          data.description.present ? data.description.value : this.description,
      stars: data.stars.present ? data.stars.value : this.stars,
      forks: data.forks.present ? data.forks.value : this.forks,
      language: data.language.present ? data.language.value : this.language,
      htmlUrl: data.htmlUrl.present ? data.htmlUrl.value : this.htmlUrl,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      cachedAt: data.cachedAt.present ? data.cachedAt.value : this.cachedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CachedRepository(')
          ..write('id: $id, ')
          ..write('searchQuery: $searchQuery, ')
          ..write('name: $name, ')
          ..write('fullName: $fullName, ')
          ..write('ownerLogin: $ownerLogin, ')
          ..write('ownerAvatarUrl: $ownerAvatarUrl, ')
          ..write('description: $description, ')
          ..write('stars: $stars, ')
          ..write('forks: $forks, ')
          ..write('language: $language, ')
          ..write('htmlUrl: $htmlUrl, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('cachedAt: $cachedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      searchQuery,
      name,
      fullName,
      ownerLogin,
      ownerAvatarUrl,
      description,
      stars,
      forks,
      language,
      htmlUrl,
      updatedAt,
      cachedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CachedRepository &&
          other.id == this.id &&
          other.searchQuery == this.searchQuery &&
          other.name == this.name &&
          other.fullName == this.fullName &&
          other.ownerLogin == this.ownerLogin &&
          other.ownerAvatarUrl == this.ownerAvatarUrl &&
          other.description == this.description &&
          other.stars == this.stars &&
          other.forks == this.forks &&
          other.language == this.language &&
          other.htmlUrl == this.htmlUrl &&
          other.updatedAt == this.updatedAt &&
          other.cachedAt == this.cachedAt);
}

class CachedRepositoriesCompanion extends UpdateCompanion<CachedRepository> {
  final Value<int> id;
  final Value<String> searchQuery;
  final Value<String> name;
  final Value<String> fullName;
  final Value<String> ownerLogin;
  final Value<String> ownerAvatarUrl;
  final Value<String?> description;
  final Value<int> stars;
  final Value<int> forks;
  final Value<String?> language;
  final Value<String> htmlUrl;
  final Value<DateTime> updatedAt;
  final Value<DateTime> cachedAt;
  final Value<int> rowid;
  const CachedRepositoriesCompanion({
    this.id = const Value.absent(),
    this.searchQuery = const Value.absent(),
    this.name = const Value.absent(),
    this.fullName = const Value.absent(),
    this.ownerLogin = const Value.absent(),
    this.ownerAvatarUrl = const Value.absent(),
    this.description = const Value.absent(),
    this.stars = const Value.absent(),
    this.forks = const Value.absent(),
    this.language = const Value.absent(),
    this.htmlUrl = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.cachedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CachedRepositoriesCompanion.insert({
    required int id,
    required String searchQuery,
    required String name,
    required String fullName,
    required String ownerLogin,
    required String ownerAvatarUrl,
    this.description = const Value.absent(),
    required int stars,
    required int forks,
    this.language = const Value.absent(),
    required String htmlUrl,
    required DateTime updatedAt,
    required DateTime cachedAt,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        searchQuery = Value(searchQuery),
        name = Value(name),
        fullName = Value(fullName),
        ownerLogin = Value(ownerLogin),
        ownerAvatarUrl = Value(ownerAvatarUrl),
        stars = Value(stars),
        forks = Value(forks),
        htmlUrl = Value(htmlUrl),
        updatedAt = Value(updatedAt),
        cachedAt = Value(cachedAt);
  static Insertable<CachedRepository> custom({
    Expression<int>? id,
    Expression<String>? searchQuery,
    Expression<String>? name,
    Expression<String>? fullName,
    Expression<String>? ownerLogin,
    Expression<String>? ownerAvatarUrl,
    Expression<String>? description,
    Expression<int>? stars,
    Expression<int>? forks,
    Expression<String>? language,
    Expression<String>? htmlUrl,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? cachedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (searchQuery != null) 'search_query': searchQuery,
      if (name != null) 'name': name,
      if (fullName != null) 'full_name': fullName,
      if (ownerLogin != null) 'owner_login': ownerLogin,
      if (ownerAvatarUrl != null) 'owner_avatar_url': ownerAvatarUrl,
      if (description != null) 'description': description,
      if (stars != null) 'stars': stars,
      if (forks != null) 'forks': forks,
      if (language != null) 'language': language,
      if (htmlUrl != null) 'html_url': htmlUrl,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (cachedAt != null) 'cached_at': cachedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CachedRepositoriesCompanion copyWith(
      {Value<int>? id,
      Value<String>? searchQuery,
      Value<String>? name,
      Value<String>? fullName,
      Value<String>? ownerLogin,
      Value<String>? ownerAvatarUrl,
      Value<String?>? description,
      Value<int>? stars,
      Value<int>? forks,
      Value<String?>? language,
      Value<String>? htmlUrl,
      Value<DateTime>? updatedAt,
      Value<DateTime>? cachedAt,
      Value<int>? rowid}) {
    return CachedRepositoriesCompanion(
      id: id ?? this.id,
      searchQuery: searchQuery ?? this.searchQuery,
      name: name ?? this.name,
      fullName: fullName ?? this.fullName,
      ownerLogin: ownerLogin ?? this.ownerLogin,
      ownerAvatarUrl: ownerAvatarUrl ?? this.ownerAvatarUrl,
      description: description ?? this.description,
      stars: stars ?? this.stars,
      forks: forks ?? this.forks,
      language: language ?? this.language,
      htmlUrl: htmlUrl ?? this.htmlUrl,
      updatedAt: updatedAt ?? this.updatedAt,
      cachedAt: cachedAt ?? this.cachedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (searchQuery.present) {
      map['search_query'] = Variable<String>(searchQuery.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (fullName.present) {
      map['full_name'] = Variable<String>(fullName.value);
    }
    if (ownerLogin.present) {
      map['owner_login'] = Variable<String>(ownerLogin.value);
    }
    if (ownerAvatarUrl.present) {
      map['owner_avatar_url'] = Variable<String>(ownerAvatarUrl.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (stars.present) {
      map['stars'] = Variable<int>(stars.value);
    }
    if (forks.present) {
      map['forks'] = Variable<int>(forks.value);
    }
    if (language.present) {
      map['language'] = Variable<String>(language.value);
    }
    if (htmlUrl.present) {
      map['html_url'] = Variable<String>(htmlUrl.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (cachedAt.present) {
      map['cached_at'] = Variable<DateTime>(cachedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CachedRepositoriesCompanion(')
          ..write('id: $id, ')
          ..write('searchQuery: $searchQuery, ')
          ..write('name: $name, ')
          ..write('fullName: $fullName, ')
          ..write('ownerLogin: $ownerLogin, ')
          ..write('ownerAvatarUrl: $ownerAvatarUrl, ')
          ..write('description: $description, ')
          ..write('stars: $stars, ')
          ..write('forks: $forks, ')
          ..write('language: $language, ')
          ..write('htmlUrl: $htmlUrl, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('cachedAt: $cachedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $FavoriteRepositoriesTable extends FavoriteRepositories
    with TableInfo<$FavoriteRepositoriesTable, FavoriteRepository> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FavoriteRepositoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _fullNameMeta =
      const VerificationMeta('fullName');
  @override
  late final GeneratedColumn<String> fullName = GeneratedColumn<String>(
      'full_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _ownerLoginMeta =
      const VerificationMeta('ownerLogin');
  @override
  late final GeneratedColumn<String> ownerLogin = GeneratedColumn<String>(
      'owner_login', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _ownerAvatarUrlMeta =
      const VerificationMeta('ownerAvatarUrl');
  @override
  late final GeneratedColumn<String> ownerAvatarUrl = GeneratedColumn<String>(
      'owner_avatar_url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _starsMeta = const VerificationMeta('stars');
  @override
  late final GeneratedColumn<int> stars = GeneratedColumn<int>(
      'stars', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _forksMeta = const VerificationMeta('forks');
  @override
  late final GeneratedColumn<int> forks = GeneratedColumn<int>(
      'forks', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _languageMeta =
      const VerificationMeta('language');
  @override
  late final GeneratedColumn<String> language = GeneratedColumn<String>(
      'language', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _htmlUrlMeta =
      const VerificationMeta('htmlUrl');
  @override
  late final GeneratedColumn<String> htmlUrl = GeneratedColumn<String>(
      'html_url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _favoritedAtMeta =
      const VerificationMeta('favoritedAt');
  @override
  late final GeneratedColumn<DateTime> favoritedAt = GeneratedColumn<DateTime>(
      'favorited_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        fullName,
        ownerLogin,
        ownerAvatarUrl,
        description,
        stars,
        forks,
        language,
        htmlUrl,
        updatedAt,
        favoritedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'favorite_repositories';
  @override
  VerificationContext validateIntegrity(Insertable<FavoriteRepository> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('full_name')) {
      context.handle(_fullNameMeta,
          fullName.isAcceptableOrUnknown(data['full_name']!, _fullNameMeta));
    } else if (isInserting) {
      context.missing(_fullNameMeta);
    }
    if (data.containsKey('owner_login')) {
      context.handle(
          _ownerLoginMeta,
          ownerLogin.isAcceptableOrUnknown(
              data['owner_login']!, _ownerLoginMeta));
    } else if (isInserting) {
      context.missing(_ownerLoginMeta);
    }
    if (data.containsKey('owner_avatar_url')) {
      context.handle(
          _ownerAvatarUrlMeta,
          ownerAvatarUrl.isAcceptableOrUnknown(
              data['owner_avatar_url']!, _ownerAvatarUrlMeta));
    } else if (isInserting) {
      context.missing(_ownerAvatarUrlMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('stars')) {
      context.handle(
          _starsMeta, stars.isAcceptableOrUnknown(data['stars']!, _starsMeta));
    } else if (isInserting) {
      context.missing(_starsMeta);
    }
    if (data.containsKey('forks')) {
      context.handle(
          _forksMeta, forks.isAcceptableOrUnknown(data['forks']!, _forksMeta));
    } else if (isInserting) {
      context.missing(_forksMeta);
    }
    if (data.containsKey('language')) {
      context.handle(_languageMeta,
          language.isAcceptableOrUnknown(data['language']!, _languageMeta));
    }
    if (data.containsKey('html_url')) {
      context.handle(_htmlUrlMeta,
          htmlUrl.isAcceptableOrUnknown(data['html_url']!, _htmlUrlMeta));
    } else if (isInserting) {
      context.missing(_htmlUrlMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('favorited_at')) {
      context.handle(
          _favoritedAtMeta,
          favoritedAt.isAcceptableOrUnknown(
              data['favorited_at']!, _favoritedAtMeta));
    } else if (isInserting) {
      context.missing(_favoritedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FavoriteRepository map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FavoriteRepository(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      fullName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}full_name'])!,
      ownerLogin: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}owner_login'])!,
      ownerAvatarUrl: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}owner_avatar_url'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      stars: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}stars'])!,
      forks: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}forks'])!,
      language: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}language']),
      htmlUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}html_url'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      favoritedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}favorited_at'])!,
    );
  }

  @override
  $FavoriteRepositoriesTable createAlias(String alias) {
    return $FavoriteRepositoriesTable(attachedDatabase, alias);
  }
}

class FavoriteRepository extends DataClass
    implements Insertable<FavoriteRepository> {
  final int id;
  final String name;
  final String fullName;
  final String ownerLogin;
  final String ownerAvatarUrl;
  final String? description;
  final int stars;
  final int forks;
  final String? language;
  final String htmlUrl;
  final DateTime updatedAt;
  final DateTime favoritedAt;
  const FavoriteRepository(
      {required this.id,
      required this.name,
      required this.fullName,
      required this.ownerLogin,
      required this.ownerAvatarUrl,
      this.description,
      required this.stars,
      required this.forks,
      this.language,
      required this.htmlUrl,
      required this.updatedAt,
      required this.favoritedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['full_name'] = Variable<String>(fullName);
    map['owner_login'] = Variable<String>(ownerLogin);
    map['owner_avatar_url'] = Variable<String>(ownerAvatarUrl);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['stars'] = Variable<int>(stars);
    map['forks'] = Variable<int>(forks);
    if (!nullToAbsent || language != null) {
      map['language'] = Variable<String>(language);
    }
    map['html_url'] = Variable<String>(htmlUrl);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['favorited_at'] = Variable<DateTime>(favoritedAt);
    return map;
  }

  FavoriteRepositoriesCompanion toCompanion(bool nullToAbsent) {
    return FavoriteRepositoriesCompanion(
      id: Value(id),
      name: Value(name),
      fullName: Value(fullName),
      ownerLogin: Value(ownerLogin),
      ownerAvatarUrl: Value(ownerAvatarUrl),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      stars: Value(stars),
      forks: Value(forks),
      language: language == null && nullToAbsent
          ? const Value.absent()
          : Value(language),
      htmlUrl: Value(htmlUrl),
      updatedAt: Value(updatedAt),
      favoritedAt: Value(favoritedAt),
    );
  }

  factory FavoriteRepository.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FavoriteRepository(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      fullName: serializer.fromJson<String>(json['fullName']),
      ownerLogin: serializer.fromJson<String>(json['ownerLogin']),
      ownerAvatarUrl: serializer.fromJson<String>(json['ownerAvatarUrl']),
      description: serializer.fromJson<String?>(json['description']),
      stars: serializer.fromJson<int>(json['stars']),
      forks: serializer.fromJson<int>(json['forks']),
      language: serializer.fromJson<String?>(json['language']),
      htmlUrl: serializer.fromJson<String>(json['htmlUrl']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      favoritedAt: serializer.fromJson<DateTime>(json['favoritedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'fullName': serializer.toJson<String>(fullName),
      'ownerLogin': serializer.toJson<String>(ownerLogin),
      'ownerAvatarUrl': serializer.toJson<String>(ownerAvatarUrl),
      'description': serializer.toJson<String?>(description),
      'stars': serializer.toJson<int>(stars),
      'forks': serializer.toJson<int>(forks),
      'language': serializer.toJson<String?>(language),
      'htmlUrl': serializer.toJson<String>(htmlUrl),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'favoritedAt': serializer.toJson<DateTime>(favoritedAt),
    };
  }

  FavoriteRepository copyWith(
          {int? id,
          String? name,
          String? fullName,
          String? ownerLogin,
          String? ownerAvatarUrl,
          Value<String?> description = const Value.absent(),
          int? stars,
          int? forks,
          Value<String?> language = const Value.absent(),
          String? htmlUrl,
          DateTime? updatedAt,
          DateTime? favoritedAt}) =>
      FavoriteRepository(
        id: id ?? this.id,
        name: name ?? this.name,
        fullName: fullName ?? this.fullName,
        ownerLogin: ownerLogin ?? this.ownerLogin,
        ownerAvatarUrl: ownerAvatarUrl ?? this.ownerAvatarUrl,
        description: description.present ? description.value : this.description,
        stars: stars ?? this.stars,
        forks: forks ?? this.forks,
        language: language.present ? language.value : this.language,
        htmlUrl: htmlUrl ?? this.htmlUrl,
        updatedAt: updatedAt ?? this.updatedAt,
        favoritedAt: favoritedAt ?? this.favoritedAt,
      );
  FavoriteRepository copyWithCompanion(FavoriteRepositoriesCompanion data) {
    return FavoriteRepository(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      fullName: data.fullName.present ? data.fullName.value : this.fullName,
      ownerLogin:
          data.ownerLogin.present ? data.ownerLogin.value : this.ownerLogin,
      ownerAvatarUrl: data.ownerAvatarUrl.present
          ? data.ownerAvatarUrl.value
          : this.ownerAvatarUrl,
      description:
          data.description.present ? data.description.value : this.description,
      stars: data.stars.present ? data.stars.value : this.stars,
      forks: data.forks.present ? data.forks.value : this.forks,
      language: data.language.present ? data.language.value : this.language,
      htmlUrl: data.htmlUrl.present ? data.htmlUrl.value : this.htmlUrl,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      favoritedAt:
          data.favoritedAt.present ? data.favoritedAt.value : this.favoritedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FavoriteRepository(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('fullName: $fullName, ')
          ..write('ownerLogin: $ownerLogin, ')
          ..write('ownerAvatarUrl: $ownerAvatarUrl, ')
          ..write('description: $description, ')
          ..write('stars: $stars, ')
          ..write('forks: $forks, ')
          ..write('language: $language, ')
          ..write('htmlUrl: $htmlUrl, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('favoritedAt: $favoritedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      name,
      fullName,
      ownerLogin,
      ownerAvatarUrl,
      description,
      stars,
      forks,
      language,
      htmlUrl,
      updatedAt,
      favoritedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FavoriteRepository &&
          other.id == this.id &&
          other.name == this.name &&
          other.fullName == this.fullName &&
          other.ownerLogin == this.ownerLogin &&
          other.ownerAvatarUrl == this.ownerAvatarUrl &&
          other.description == this.description &&
          other.stars == this.stars &&
          other.forks == this.forks &&
          other.language == this.language &&
          other.htmlUrl == this.htmlUrl &&
          other.updatedAt == this.updatedAt &&
          other.favoritedAt == this.favoritedAt);
}

class FavoriteRepositoriesCompanion
    extends UpdateCompanion<FavoriteRepository> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> fullName;
  final Value<String> ownerLogin;
  final Value<String> ownerAvatarUrl;
  final Value<String?> description;
  final Value<int> stars;
  final Value<int> forks;
  final Value<String?> language;
  final Value<String> htmlUrl;
  final Value<DateTime> updatedAt;
  final Value<DateTime> favoritedAt;
  const FavoriteRepositoriesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.fullName = const Value.absent(),
    this.ownerLogin = const Value.absent(),
    this.ownerAvatarUrl = const Value.absent(),
    this.description = const Value.absent(),
    this.stars = const Value.absent(),
    this.forks = const Value.absent(),
    this.language = const Value.absent(),
    this.htmlUrl = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.favoritedAt = const Value.absent(),
  });
  FavoriteRepositoriesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String fullName,
    required String ownerLogin,
    required String ownerAvatarUrl,
    this.description = const Value.absent(),
    required int stars,
    required int forks,
    this.language = const Value.absent(),
    required String htmlUrl,
    required DateTime updatedAt,
    required DateTime favoritedAt,
  })  : name = Value(name),
        fullName = Value(fullName),
        ownerLogin = Value(ownerLogin),
        ownerAvatarUrl = Value(ownerAvatarUrl),
        stars = Value(stars),
        forks = Value(forks),
        htmlUrl = Value(htmlUrl),
        updatedAt = Value(updatedAt),
        favoritedAt = Value(favoritedAt);
  static Insertable<FavoriteRepository> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? fullName,
    Expression<String>? ownerLogin,
    Expression<String>? ownerAvatarUrl,
    Expression<String>? description,
    Expression<int>? stars,
    Expression<int>? forks,
    Expression<String>? language,
    Expression<String>? htmlUrl,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? favoritedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (fullName != null) 'full_name': fullName,
      if (ownerLogin != null) 'owner_login': ownerLogin,
      if (ownerAvatarUrl != null) 'owner_avatar_url': ownerAvatarUrl,
      if (description != null) 'description': description,
      if (stars != null) 'stars': stars,
      if (forks != null) 'forks': forks,
      if (language != null) 'language': language,
      if (htmlUrl != null) 'html_url': htmlUrl,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (favoritedAt != null) 'favorited_at': favoritedAt,
    });
  }

  FavoriteRepositoriesCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? fullName,
      Value<String>? ownerLogin,
      Value<String>? ownerAvatarUrl,
      Value<String?>? description,
      Value<int>? stars,
      Value<int>? forks,
      Value<String?>? language,
      Value<String>? htmlUrl,
      Value<DateTime>? updatedAt,
      Value<DateTime>? favoritedAt}) {
    return FavoriteRepositoriesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      fullName: fullName ?? this.fullName,
      ownerLogin: ownerLogin ?? this.ownerLogin,
      ownerAvatarUrl: ownerAvatarUrl ?? this.ownerAvatarUrl,
      description: description ?? this.description,
      stars: stars ?? this.stars,
      forks: forks ?? this.forks,
      language: language ?? this.language,
      htmlUrl: htmlUrl ?? this.htmlUrl,
      updatedAt: updatedAt ?? this.updatedAt,
      favoritedAt: favoritedAt ?? this.favoritedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (fullName.present) {
      map['full_name'] = Variable<String>(fullName.value);
    }
    if (ownerLogin.present) {
      map['owner_login'] = Variable<String>(ownerLogin.value);
    }
    if (ownerAvatarUrl.present) {
      map['owner_avatar_url'] = Variable<String>(ownerAvatarUrl.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (stars.present) {
      map['stars'] = Variable<int>(stars.value);
    }
    if (forks.present) {
      map['forks'] = Variable<int>(forks.value);
    }
    if (language.present) {
      map['language'] = Variable<String>(language.value);
    }
    if (htmlUrl.present) {
      map['html_url'] = Variable<String>(htmlUrl.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (favoritedAt.present) {
      map['favorited_at'] = Variable<DateTime>(favoritedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FavoriteRepositoriesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('fullName: $fullName, ')
          ..write('ownerLogin: $ownerLogin, ')
          ..write('ownerAvatarUrl: $ownerAvatarUrl, ')
          ..write('description: $description, ')
          ..write('stars: $stars, ')
          ..write('forks: $forks, ')
          ..write('language: $language, ')
          ..write('htmlUrl: $htmlUrl, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('favoritedAt: $favoritedAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CachedRepositoriesTable cachedRepositories =
      $CachedRepositoriesTable(this);
  late final $FavoriteRepositoriesTable favoriteRepositories =
      $FavoriteRepositoriesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [cachedRepositories, favoriteRepositories];
}

typedef $$CachedRepositoriesTableCreateCompanionBuilder
    = CachedRepositoriesCompanion Function({
  required int id,
  required String searchQuery,
  required String name,
  required String fullName,
  required String ownerLogin,
  required String ownerAvatarUrl,
  Value<String?> description,
  required int stars,
  required int forks,
  Value<String?> language,
  required String htmlUrl,
  required DateTime updatedAt,
  required DateTime cachedAt,
  Value<int> rowid,
});
typedef $$CachedRepositoriesTableUpdateCompanionBuilder
    = CachedRepositoriesCompanion Function({
  Value<int> id,
  Value<String> searchQuery,
  Value<String> name,
  Value<String> fullName,
  Value<String> ownerLogin,
  Value<String> ownerAvatarUrl,
  Value<String?> description,
  Value<int> stars,
  Value<int> forks,
  Value<String?> language,
  Value<String> htmlUrl,
  Value<DateTime> updatedAt,
  Value<DateTime> cachedAt,
  Value<int> rowid,
});

class $$CachedRepositoriesTableFilterComposer
    extends Composer<_$AppDatabase, $CachedRepositoriesTable> {
  $$CachedRepositoriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get searchQuery => $composableBuilder(
      column: $table.searchQuery, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get fullName => $composableBuilder(
      column: $table.fullName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get ownerLogin => $composableBuilder(
      column: $table.ownerLogin, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get ownerAvatarUrl => $composableBuilder(
      column: $table.ownerAvatarUrl,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get stars => $composableBuilder(
      column: $table.stars, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get forks => $composableBuilder(
      column: $table.forks, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get language => $composableBuilder(
      column: $table.language, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get htmlUrl => $composableBuilder(
      column: $table.htmlUrl, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get cachedAt => $composableBuilder(
      column: $table.cachedAt, builder: (column) => ColumnFilters(column));
}

class $$CachedRepositoriesTableOrderingComposer
    extends Composer<_$AppDatabase, $CachedRepositoriesTable> {
  $$CachedRepositoriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get searchQuery => $composableBuilder(
      column: $table.searchQuery, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get fullName => $composableBuilder(
      column: $table.fullName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get ownerLogin => $composableBuilder(
      column: $table.ownerLogin, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get ownerAvatarUrl => $composableBuilder(
      column: $table.ownerAvatarUrl,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get stars => $composableBuilder(
      column: $table.stars, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get forks => $composableBuilder(
      column: $table.forks, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get language => $composableBuilder(
      column: $table.language, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get htmlUrl => $composableBuilder(
      column: $table.htmlUrl, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get cachedAt => $composableBuilder(
      column: $table.cachedAt, builder: (column) => ColumnOrderings(column));
}

class $$CachedRepositoriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CachedRepositoriesTable> {
  $$CachedRepositoriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get searchQuery => $composableBuilder(
      column: $table.searchQuery, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get fullName =>
      $composableBuilder(column: $table.fullName, builder: (column) => column);

  GeneratedColumn<String> get ownerLogin => $composableBuilder(
      column: $table.ownerLogin, builder: (column) => column);

  GeneratedColumn<String> get ownerAvatarUrl => $composableBuilder(
      column: $table.ownerAvatarUrl, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<int> get stars =>
      $composableBuilder(column: $table.stars, builder: (column) => column);

  GeneratedColumn<int> get forks =>
      $composableBuilder(column: $table.forks, builder: (column) => column);

  GeneratedColumn<String> get language =>
      $composableBuilder(column: $table.language, builder: (column) => column);

  GeneratedColumn<String> get htmlUrl =>
      $composableBuilder(column: $table.htmlUrl, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get cachedAt =>
      $composableBuilder(column: $table.cachedAt, builder: (column) => column);
}

class $$CachedRepositoriesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CachedRepositoriesTable,
    CachedRepository,
    $$CachedRepositoriesTableFilterComposer,
    $$CachedRepositoriesTableOrderingComposer,
    $$CachedRepositoriesTableAnnotationComposer,
    $$CachedRepositoriesTableCreateCompanionBuilder,
    $$CachedRepositoriesTableUpdateCompanionBuilder,
    (
      CachedRepository,
      BaseReferences<_$AppDatabase, $CachedRepositoriesTable, CachedRepository>
    ),
    CachedRepository,
    PrefetchHooks Function()> {
  $$CachedRepositoriesTableTableManager(
      _$AppDatabase db, $CachedRepositoriesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CachedRepositoriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CachedRepositoriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CachedRepositoriesTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> searchQuery = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> fullName = const Value.absent(),
            Value<String> ownerLogin = const Value.absent(),
            Value<String> ownerAvatarUrl = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<int> stars = const Value.absent(),
            Value<int> forks = const Value.absent(),
            Value<String?> language = const Value.absent(),
            Value<String> htmlUrl = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<DateTime> cachedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CachedRepositoriesCompanion(
            id: id,
            searchQuery: searchQuery,
            name: name,
            fullName: fullName,
            ownerLogin: ownerLogin,
            ownerAvatarUrl: ownerAvatarUrl,
            description: description,
            stars: stars,
            forks: forks,
            language: language,
            htmlUrl: htmlUrl,
            updatedAt: updatedAt,
            cachedAt: cachedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int id,
            required String searchQuery,
            required String name,
            required String fullName,
            required String ownerLogin,
            required String ownerAvatarUrl,
            Value<String?> description = const Value.absent(),
            required int stars,
            required int forks,
            Value<String?> language = const Value.absent(),
            required String htmlUrl,
            required DateTime updatedAt,
            required DateTime cachedAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              CachedRepositoriesCompanion.insert(
            id: id,
            searchQuery: searchQuery,
            name: name,
            fullName: fullName,
            ownerLogin: ownerLogin,
            ownerAvatarUrl: ownerAvatarUrl,
            description: description,
            stars: stars,
            forks: forks,
            language: language,
            htmlUrl: htmlUrl,
            updatedAt: updatedAt,
            cachedAt: cachedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CachedRepositoriesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CachedRepositoriesTable,
    CachedRepository,
    $$CachedRepositoriesTableFilterComposer,
    $$CachedRepositoriesTableOrderingComposer,
    $$CachedRepositoriesTableAnnotationComposer,
    $$CachedRepositoriesTableCreateCompanionBuilder,
    $$CachedRepositoriesTableUpdateCompanionBuilder,
    (
      CachedRepository,
      BaseReferences<_$AppDatabase, $CachedRepositoriesTable, CachedRepository>
    ),
    CachedRepository,
    PrefetchHooks Function()>;
typedef $$FavoriteRepositoriesTableCreateCompanionBuilder
    = FavoriteRepositoriesCompanion Function({
  Value<int> id,
  required String name,
  required String fullName,
  required String ownerLogin,
  required String ownerAvatarUrl,
  Value<String?> description,
  required int stars,
  required int forks,
  Value<String?> language,
  required String htmlUrl,
  required DateTime updatedAt,
  required DateTime favoritedAt,
});
typedef $$FavoriteRepositoriesTableUpdateCompanionBuilder
    = FavoriteRepositoriesCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String> fullName,
  Value<String> ownerLogin,
  Value<String> ownerAvatarUrl,
  Value<String?> description,
  Value<int> stars,
  Value<int> forks,
  Value<String?> language,
  Value<String> htmlUrl,
  Value<DateTime> updatedAt,
  Value<DateTime> favoritedAt,
});

class $$FavoriteRepositoriesTableFilterComposer
    extends Composer<_$AppDatabase, $FavoriteRepositoriesTable> {
  $$FavoriteRepositoriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get fullName => $composableBuilder(
      column: $table.fullName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get ownerLogin => $composableBuilder(
      column: $table.ownerLogin, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get ownerAvatarUrl => $composableBuilder(
      column: $table.ownerAvatarUrl,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get stars => $composableBuilder(
      column: $table.stars, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get forks => $composableBuilder(
      column: $table.forks, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get language => $composableBuilder(
      column: $table.language, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get htmlUrl => $composableBuilder(
      column: $table.htmlUrl, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get favoritedAt => $composableBuilder(
      column: $table.favoritedAt, builder: (column) => ColumnFilters(column));
}

class $$FavoriteRepositoriesTableOrderingComposer
    extends Composer<_$AppDatabase, $FavoriteRepositoriesTable> {
  $$FavoriteRepositoriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get fullName => $composableBuilder(
      column: $table.fullName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get ownerLogin => $composableBuilder(
      column: $table.ownerLogin, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get ownerAvatarUrl => $composableBuilder(
      column: $table.ownerAvatarUrl,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get stars => $composableBuilder(
      column: $table.stars, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get forks => $composableBuilder(
      column: $table.forks, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get language => $composableBuilder(
      column: $table.language, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get htmlUrl => $composableBuilder(
      column: $table.htmlUrl, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get favoritedAt => $composableBuilder(
      column: $table.favoritedAt, builder: (column) => ColumnOrderings(column));
}

class $$FavoriteRepositoriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $FavoriteRepositoriesTable> {
  $$FavoriteRepositoriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get fullName =>
      $composableBuilder(column: $table.fullName, builder: (column) => column);

  GeneratedColumn<String> get ownerLogin => $composableBuilder(
      column: $table.ownerLogin, builder: (column) => column);

  GeneratedColumn<String> get ownerAvatarUrl => $composableBuilder(
      column: $table.ownerAvatarUrl, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<int> get stars =>
      $composableBuilder(column: $table.stars, builder: (column) => column);

  GeneratedColumn<int> get forks =>
      $composableBuilder(column: $table.forks, builder: (column) => column);

  GeneratedColumn<String> get language =>
      $composableBuilder(column: $table.language, builder: (column) => column);

  GeneratedColumn<String> get htmlUrl =>
      $composableBuilder(column: $table.htmlUrl, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get favoritedAt => $composableBuilder(
      column: $table.favoritedAt, builder: (column) => column);
}

class $$FavoriteRepositoriesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $FavoriteRepositoriesTable,
    FavoriteRepository,
    $$FavoriteRepositoriesTableFilterComposer,
    $$FavoriteRepositoriesTableOrderingComposer,
    $$FavoriteRepositoriesTableAnnotationComposer,
    $$FavoriteRepositoriesTableCreateCompanionBuilder,
    $$FavoriteRepositoriesTableUpdateCompanionBuilder,
    (
      FavoriteRepository,
      BaseReferences<_$AppDatabase, $FavoriteRepositoriesTable,
          FavoriteRepository>
    ),
    FavoriteRepository,
    PrefetchHooks Function()> {
  $$FavoriteRepositoriesTableTableManager(
      _$AppDatabase db, $FavoriteRepositoriesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FavoriteRepositoriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FavoriteRepositoriesTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FavoriteRepositoriesTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> fullName = const Value.absent(),
            Value<String> ownerLogin = const Value.absent(),
            Value<String> ownerAvatarUrl = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<int> stars = const Value.absent(),
            Value<int> forks = const Value.absent(),
            Value<String?> language = const Value.absent(),
            Value<String> htmlUrl = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<DateTime> favoritedAt = const Value.absent(),
          }) =>
              FavoriteRepositoriesCompanion(
            id: id,
            name: name,
            fullName: fullName,
            ownerLogin: ownerLogin,
            ownerAvatarUrl: ownerAvatarUrl,
            description: description,
            stars: stars,
            forks: forks,
            language: language,
            htmlUrl: htmlUrl,
            updatedAt: updatedAt,
            favoritedAt: favoritedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required String fullName,
            required String ownerLogin,
            required String ownerAvatarUrl,
            Value<String?> description = const Value.absent(),
            required int stars,
            required int forks,
            Value<String?> language = const Value.absent(),
            required String htmlUrl,
            required DateTime updatedAt,
            required DateTime favoritedAt,
          }) =>
              FavoriteRepositoriesCompanion.insert(
            id: id,
            name: name,
            fullName: fullName,
            ownerLogin: ownerLogin,
            ownerAvatarUrl: ownerAvatarUrl,
            description: description,
            stars: stars,
            forks: forks,
            language: language,
            htmlUrl: htmlUrl,
            updatedAt: updatedAt,
            favoritedAt: favoritedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$FavoriteRepositoriesTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $FavoriteRepositoriesTable,
        FavoriteRepository,
        $$FavoriteRepositoriesTableFilterComposer,
        $$FavoriteRepositoriesTableOrderingComposer,
        $$FavoriteRepositoriesTableAnnotationComposer,
        $$FavoriteRepositoriesTableCreateCompanionBuilder,
        $$FavoriteRepositoriesTableUpdateCompanionBuilder,
        (
          FavoriteRepository,
          BaseReferences<_$AppDatabase, $FavoriteRepositoriesTable,
              FavoriteRepository>
        ),
        FavoriteRepository,
        PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CachedRepositoriesTableTableManager get cachedRepositories =>
      $$CachedRepositoriesTableTableManager(_db, _db.cachedRepositories);
  $$FavoriteRepositoriesTableTableManager get favoriteRepositories =>
      $$FavoriteRepositoriesTableTableManager(_db, _db.favoriteRepositories);
}
