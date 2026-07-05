import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/app_empty_widget.dart';
import '../../../../core/widgets/app_error_widget.dart';
import '../../../../core/widgets/shimmer_loading.dart';
import '../../../../routes/route_names.dart';
import '../../../repo_search/domain/entities/github_repo.dart';
import '../../../repo_search/presentation/widgets/repo_card.dart';
import '../providers/favorites_provider.dart';

/// Lists every repository the user has saved, entirely from the local
/// database - works fully offline since favorites never depend on the
/// network once they've been saved.
class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<GithubRepo>> favoritesAsync =
        ref.watch(favoritesNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Favorites')),
      body: favoritesAsync.when(
        loading: () => const ShimmerRepoList(itemCount: 4),
        error: (error, _) => AppErrorWidget(
          message: error.toString(),
          onRetry: () => ref.read(favoritesNotifierProvider.notifier).refresh(),
        ),
        data: (favorites) {
          if (favorites.isEmpty) {
            return const AppEmptyWidget(
              title: 'No favorites yet',
              subtitle: 'Tap the star on any repository to save it here for offline access.',
              icon: Icons.star_border_rounded,
            );
          }
          return RefreshIndicator(
            onRefresh: () => ref.read(favoritesNotifierProvider.notifier).refresh(),
            child: ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: favorites.length,
              separatorBuilder: (_, __) => const SizedBox(height: 10),
              itemBuilder: (context, index) {
                final repo = favorites[index];
                return RepoCard(
                  repo: repo,
                  onTap: () => context.goNamed(
                    RouteNames.details,
                    pathParameters: {'id': repo.id.toString()},
                  ),
                  onFavoriteToggle: () =>
                      ref.read(favoritesNotifierProvider.notifier).toggle(repo),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
