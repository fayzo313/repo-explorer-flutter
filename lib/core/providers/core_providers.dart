import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../database/app_database.dart';
import '../network/dio_client.dart';
import '../network/network_info.dart';

/// -------------------------------------------------------------------
/// Cross-cutting / infrastructure providers.
///
/// This is the app's Dependency Injection container: every low-level
/// dependency (Dio, the database, connectivity) is created exactly
/// once here and exposed as a provider. Feature repositories then
/// `ref.watch`/`ref.read` these instead of constructing dependencies
/// themselves - classic constructor injection, just wired by Riverpod
/// instead of a service locator like get_it.
/// -------------------------------------------------------------------

final Provider<Dio> dioProvider = Provider<Dio>((ref) {
  return DioClient.create();
});

/// `keepAlive` because a single SQLite connection should live for the
/// whole app lifetime, not be disposed when a screen unmounts.
final Provider<AppDatabase> appDatabaseProvider = Provider<AppDatabase>((ref) {
  final AppDatabase db = AppDatabase();
  ref.onDispose(db.close);
  return db;
}, name: 'appDatabaseProvider');

final Provider<Connectivity> connectivityProvider = Provider<Connectivity>((ref) {
  return Connectivity();
});

final Provider<NetworkInfo> networkInfoProvider = Provider<NetworkInfo>((ref) {
  return NetworkInfoImpl(ref.watch(connectivityProvider));
});
