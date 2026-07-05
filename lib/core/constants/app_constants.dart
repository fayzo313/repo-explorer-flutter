/// General, non-networking app-wide constants.
class AppConstants {
  const AppConstants._();

  static const String appName = 'Repo Explorer';

  /// How long a cached search result is considered "fresh" before we
  /// prefer a network refresh (still shown instantly from cache first).
  static const Duration cacheFreshness = Duration(minutes: 30);

  static const Duration searchDebounce = Duration(milliseconds: 450);

  static const String databaseFileName = 'repo_explorer.sqlite';
}
