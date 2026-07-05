import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../domain/entities/github_repo.dart';

/// The single reusable "repository" card used by both the Home screen
/// and the Favorites screen - one widget, one visual language, one
/// place to fix a bug or tweak the design.
class RepoCard extends StatelessWidget {
  const RepoCard({
    required this.repo,
    required this.onTap,
    required this.onFavoriteToggle,
    super.key,
  });

  final GithubRepo repo;
  final VoidCallback onTap;
  final VoidCallback onFavoriteToggle;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;

    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                      imageUrl: repo.ownerAvatarUrl,
                      width: 40,
                      height: 40,
                      placeholder: (_, __) => Container(
                        width: 40,
                        height: 40,
                        color: colors.surfaceContainerHighest,
                      ),
                      errorWidget: (_, __, ___) => Container(
                        width: 40,
                        height: 40,
                        color: colors.surfaceContainerHighest,
                        child: const Icon(Icons.person, size: 20),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          repo.name,
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          repo.ownerLogin,
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: colors.onSurfaceVariant,
                              ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: onFavoriteToggle,
                    icon: Icon(
                      repo.isFavorite ? Icons.star_rounded : Icons.star_outline_rounded,
                      color: repo.isFavorite ? Colors.amber.shade600 : colors.outline,
                    ),
                    tooltip: repo.isFavorite ? 'Remove from favorites' : 'Add to favorites',
                  ),
                ],
              ),
              if (repo.description != null && repo.description!.isNotEmpty) ...[
                const SizedBox(height: 8),
                Text(
                  repo.description!,
                  style: Theme.of(context).textTheme.bodyMedium,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
              const SizedBox(height: 10),
              Row(
                children: [
                  if (repo.language != null) ...[
                    _LanguageDot(language: repo.language!),
                    const SizedBox(width: 4),
                    Text(repo.language!, style: Theme.of(context).textTheme.bodySmall),
                    const SizedBox(width: 14),
                  ],
                  Icon(Icons.star_rounded, size: 15, color: colors.outline),
                  const SizedBox(width: 3),
                  Text(_formatCount(repo.stars), style: Theme.of(context).textTheme.bodySmall),
                  const SizedBox(width: 14),
                  Icon(Icons.call_split_rounded, size: 15, color: colors.outline),
                  const SizedBox(width: 3),
                  Text(_formatCount(repo.forks), style: Theme.of(context).textTheme.bodySmall),
                  const Spacer(),
                  Text(
                    _timeAgo(repo.updatedAt),
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: colors.onSurfaceVariant,
                        ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatCount(int count) {
    if (count >= 1000000) return '${(count / 1000000).toStringAsFixed(1)}M';
    if (count >= 1000) return '${(count / 1000).toStringAsFixed(1)}k';
    return NumberFormat.decimalPattern().format(count);
  }

  String _timeAgo(DateTime date) {
    final Duration diff = DateTime.now().difference(date);
    if (diff.inDays > 365) return '${(diff.inDays / 365).floor()}y ago';
    if (diff.inDays > 30) return '${(diff.inDays / 30).floor()}mo ago';
    if (diff.inDays > 0) return '${diff.inDays}d ago';
    return 'today';
  }
}

class _LanguageDot extends StatelessWidget {
  const _LanguageDot({required this.language});

  final String language;

  static const Map<String, Color> _colors = {
    'Dart': Color(0xFF00B4AB),
    'JavaScript': Color(0xFFF1E05A),
    'TypeScript': Color(0xFF3178C6),
    'Python': Color(0xFF3572A5),
    'Go': Color(0xFF00ADD8),
    'Rust': Color(0xFFDEA584),
    'Java': Color(0xFFB07219),
    'Swift': Color(0xFFF05138),
    'Kotlin': Color(0xFFA97BFF),
    'C++': Color(0xFFF34B7D),
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        color: _colors[language] ?? Colors.grey,
        shape: BoxShape.circle,
      ),
    );
  }
}
