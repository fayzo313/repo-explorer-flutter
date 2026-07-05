/// String path constants for GoRouter, kept out of the router file so
/// widgets can reference route names/paths without importing GoRouter.
class RouteNames {
  const RouteNames._();

  static const String splash = 'splash';
  static const String home = 'home';
  static const String details = 'details';
  static const String favorites = 'favorites';
}

class RoutePaths {
  const RoutePaths._();

  static const String splash = '/';
  static const String home = '/home';
  static const String details = '/home/repo/:id';
  static const String favorites = '/favorites';
}
