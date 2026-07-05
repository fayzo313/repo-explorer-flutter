import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/widgets/app_error_widget.dart';
import '../../../../core/widgets/app_loading_widget.dart';
import '../../../favorites/presentation/providers/favorites_provider.dart';
import '../../../repo_search/domain/entities/github_repo.dart';
import '../providers/repo_details_provider.dart';

/// Shows the full detail of one repository. Reached either from the
/// Explore list or from Favorites - both push the same route, which is
/// the payoff of having one shared [repoDetailsProvider] rather than
/// two screen-specific implementations.
class RepoDetailsScreen extends ConsumerWidget {
  const RepoDetailsScreen({required this.repoId, super.key});

  final int repoId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<GithubRepo> repoAsync = ref.watch(repoDetailsProvider(repoId));

    return Scaffold(
      appBar: AppBar(title: const Text('Repository')),
      body: repoAsync.when(
        loading: () => const AppLoadingWidget(),
        error: (error, _) => AppErrorWidget(
          message: error.toString(),
          onRetry: () => ref.invalidate(repoDetailsProvider(repoId)),
        ),
        data: (repo) => _DetailsBody(repo: repo),
      ),
    );
  }
}

class _DetailsBody extends ConsumerWidget {
  const _DetailsBody({required this.repo});

  final GithubRepo repo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ColorScheme colors = Theme.of(context).colorScheme;
    final bool isFavorite = ref.watch(isRepoFavoriteProvider(repo.id));

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: CachedNetworkImage(
                  imageUrl: repo.ownerAvatarUrl,
                  width: 64,
                  height: 64,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(repo.name,
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.w700,
                            )),
                    Text(repo.ownerLogin,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: colors.onSurfaceVariant,
                            )),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          if (repo.description != null) ...[
            Text(repo.description!, style: Theme.of(context).textTheme.bodyLarge),
            const SizedBox(height: 20),
          ],
          Row(
            children: [
              _StatChip(icon: Icons.star_rounded, label: '${_format(repo.stars)} stars'),
              const SizedBox(width: 10),
              _StatChip(icon: Icons.call_split_rounded, label: '${_format(repo.forks)} forks'),
              if (repo.language != null) ...[
                const SizedBox(width: 10),
                _StatChip(icon: Icons.code_rounded, label: repo.language!),
              ],
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'Updated ${DateFormat.yMMMd().format(repo.updatedAt)}',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: colors.onSurfaceVariant,
                ),
          ),
          const SizedBox(height: 28),
          Row(
            children: [
              Expanded(
                child: FilledButton.icon(
                  onPressed: () => launchUrl(
                    Uri.parse(repo.htmlUrl),
                    mode: LaunchMode.externalApplication,
                  ),
                  icon: const Icon(Icons.open_in_new_rounded, size: 18),
                  label: const Text('Open on GitHub'),
                ),
              ),
              const SizedBox(width: 12),
              OutlinedButton.icon(
                onPressed: () =>
                    ref.read(favoritesNotifierProvider.notifier).toggle(repo),
                icon: Icon(
                  isFavorite ? Icons.star_rounded : Icons.star_outline_rounded,
                  color: isFavorite ? Colors.amber.shade600 : null,
                ),
                label: Text(isFavorite ? 'Saved' : 'Save'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _format(int count) {
    if (count >= 1000) return '${(count / 1000).toStringAsFixed(1)}k';
    return count.toString();
  }
}

class _StatChip extends StatelessWidget {
  const _StatChip({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: Icon(icon, size: 16),
      label: Text(label),
    );
  }
}
