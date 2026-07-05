import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../constants/app_constants.dart';
import 'tables.dart';

part 'app_database.g.dart';

/// The single Drift database instance for the app.
///
/// Only the `data` layer ([RepoLocalDataSource]) talks to this class
/// directly - domain/presentation never import `drift`, which is the
/// whole point of the Repository Pattern: swapping Drift for Isar later
/// would only touch this file and the local data source.
@DriftDatabase(tables: [CachedRepositories, FavoriteRepositories])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  /// Named constructor used by tests to run fully in-memory.
  AppDatabase.forTesting(super.executor);

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return LazyDatabase(() async {
      final Directory dir = await getApplicationDocumentsDirectory();
      final File file = File(p.join(dir.path, AppConstants.databaseFileName));
      return NativeDatabase.createInBackground(file);
    });
  }
}
