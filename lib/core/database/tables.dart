import 'package:drift/drift.dart';

/// Cached search results, keyed by the search query so repeated
/// searches can be served instantly from disk before/while the network
/// call resolves (offline-first / stale-while-revalidate pattern).
class CachedRepositories extends Table {
  IntColumn get id => integer()(); // GitHub repository id (primary key)
  TextColumn get searchQuery => text()();
  TextColumn get name => text()();
  TextColumn get fullName => text()();
  TextColumn get ownerLogin => text()();
  TextColumn get ownerAvatarUrl => text()();
  TextColumn get description => text().nullable()();
  IntColumn get stars => integer()();
  IntColumn get forks => integer()();
  TextColumn get language => text().nullable()();
  TextColumn get htmlUrl => text()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get cachedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id, searchQuery};
}

/// Repositories the user explicitly favorited. Kept in a dedicated table
/// (rather than a boolean flag on [CachedRepositories]) because favorites
/// must survive independently of whatever the last search cache held.
class FavoriteRepositories extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text()();
  TextColumn get fullName => text()();
  TextColumn get ownerLogin => text()();
  TextColumn get ownerAvatarUrl => text()();
  TextColumn get description => text().nullable()();
  IntColumn get stars => integer()();
  IntColumn get forks => integer()();
  TextColumn get language => text().nullable()();
  TextColumn get htmlUrl => text()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get favoritedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
