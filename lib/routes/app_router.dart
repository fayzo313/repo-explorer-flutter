import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/favorites/presentation/screens/favorites_screen.dart';
import '../features/repo_details/presentation/screens/repo_details_screen.dart';
import '../features/repo_search/presentation/screens/home_screen.dart';
import '../features/splash/presentation/screens/splash_screen.dart';
import '../shared/widgets/main_shell.dart';
import 'route_names.dart';

/// Declarative navigation graph.
///
/// `home` and `favorites` sit inside a [StatefulShellRoute] so both tabs
/// share one persistent bottom nav bar; `details` is a plain push route
/// on top of the `home` branch (deep-linkable at `/home/repo/:id`).
final GoRouter appRouter = GoRouter(
  initialLocation: RoutePaths.splash,
  debugLogDiagnostics: false,
  routes: [
    GoRoute(
      path: RoutePaths.splash,
      name: RouteNames.splash,
      builder: (context, state) => const SplashScreen(),
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MainShell(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: RoutePaths.home,
              name: RouteNames.home,
              builder: (context, state) => const HomeScreen(),
              routes: [
                GoRoute(
                  path: 'repo/:id',
                  name: RouteNames.details,
                  builder: (context, state) {
                    final int repoId = int.parse(state.pathParameters['id']!);
                    return RepoDetailsScreen(repoId: repoId);
                  },
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: RoutePaths.favorites,
              name: RouteNames.favorites,
              builder: (context, state) => const FavoritesScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
  errorBuilder: (context, state) => Scaffold(
    body: Center(child: Text('Route not found: ${state.uri}')),
  ),
);
