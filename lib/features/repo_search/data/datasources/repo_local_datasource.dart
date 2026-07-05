import 'package:drift/drift.dart';

import '../../../../core/database/app_database.dart';
import '../../../../core/database/tables.dart';
import '../../../../core/error/exceptions.dart';
import '../models/github_repo_model.dart';

/// Everything the app persists on-device: search-result cache and
/// favorites. Wraps every Drift call in a try/catch that rethrows as
/// [CacheException], keeping Drift fully contained to this file.
abstract interface class RepoLocalDataSource {
  Future<void> cacheSearchResults(String query, List<GithubRepoModel> repos);

  Future<List<CachedRepository>> getCachedResults(String query);

  Future<void> toggleFavorite(GithubRepoModel repo, {required bool isFavorite});

  Future<List<FavoriteRepository>> getFavorites();

  Future<bool> isFavorite(int repoId);
}

class RepoLocalDataSourceImpl implements RepoLocalDataSource {
  const RepoLocalDataSourceImpl(this._db);

  final AppDatabase _db;

  @override
  Future<void> cacheSearchResults(
    String query,
    List<GithubRepoModel> repos,
  ) async {
    try {
      await _db.transaction(() async {
        await (_db.delete(_db.cachedRepositories)
              ..where((t) => t.searchQuery.equals(query)))
            .go();

        final DateTime now = DateTime.now();
        for (final GithubRepoModel repo in repos) {
          await _db.into(_db.cachedRepositories).insertOnConflictUpdate(
                CachedRepositoriesCompanion.insert(
                  id: repo.id,
                  searchQuery: query,
                  name: repo.name,
                  fullName: repo.fullName,
                  ownerLogin: repo.owner.login,
                  ownerAvatarUrl: repo.owner.avatarUrl,
                  description: Value(repo.description),
                  stars: repo.stars,
                  forks: repo.forks,
                  language: Value(repo.language),
                  htmlUrl: repo.htmlUrl,
                  updatedAt: repo.updatedAt,
                  cachedAt: now,
                ),
              );
        }
      });
    } catch (_) {
      throw const CacheException('Failed to cache search results.');
    }
  }

  @override
  Future<List<CachedRepository>> getCachedResults(String query) async {
    try {
      return await (_db.select(_db.cachedRepositories)
            ..where((t) => t.searchQuery.equals(query))
            ..orderBy([(t) => OrderingTerm.desc(t.stars)]))
          .get();
    } catch (_) {
      throw const CacheException('Failed to read cached search results.');
    }
  }

  @override
  Future<void> toggleFavorite(
    GithubRepoModel repo, {
    required bool isFavorite,
  }) async {
    try {
      if (isFavorite) {
        await _db.into(_db.favoriteRepositories).insertOnConflictUpdate(
              FavoriteRepositoriesCompanion.insert(
  id: Value(repo.id),
                name: repo.name,
                fullName: repo.fullName,
                ownerLogin: repo.owner.login,
                ownerAvatarUrl: repo.owner.avatarUrl,
                description: Value(repo.description),
                stars: repo.stars,
                forks: repo.forks,
                language: Value(repo.language),
                htmlUrl: repo.htmlUrl,
                updatedAt: repo.updatedAt,
                favoritedAt: DateTime.now(),
              ),
            );
      } else {
        await (_db.delete(_db.favoriteRepositories)
              ..where((t) => t.id.equals(repo.id)))
            .go();
      }
    } catch (_) {
      throw const CacheException('Failed to update favorites.');
    }
  }

  @override
  Future<List<FavoriteRepository>> getFavorites() async {
    try {
      return await (_db.select(_db.favoriteRepositories)
            ..orderBy([(t) => OrderingTerm.desc(t.favoritedAt)]))
          .get();
    } catch (_) {
      throw const CacheException('Failed to read favorites.');
    }
  }

  @override
  Future<bool> isFavorite(int repoId) async {
    try {
      final FavoriteRepository? row = await (_db.select(_db.favoriteRepositories)
            ..where((t) => t.id.equals(repoId)))
          .getSingleOrNull();
      return row != null;
    } catch (_) {
      throw const CacheException('Failed to check favorite status.');
    }
  }
}
