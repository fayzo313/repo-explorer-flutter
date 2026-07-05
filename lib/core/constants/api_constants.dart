/// Centralized API-related constants.
///
/// Kept separate from [AppConstants] so networking concerns can evolve
/// independently from general app constants (SRP).
class ApiConstants {
  const ApiConstants._();

  static const String searchRepositoriesPath = '/search/repositories';

  /// Default query used on the Home screen before the user searches
  /// anything - surfaces broadly popular repositories.
  static const String defaultDiscoveryQuery = 'stars:>10000';

  static const String sortByStars = 'stars';
  static const String orderDescending = 'desc';

  static const int defaultPerPage = 20;
  static const Duration connectTimeout = Duration(seconds: 10);
  static const Duration receiveTimeout = Duration(seconds: 10);
}
