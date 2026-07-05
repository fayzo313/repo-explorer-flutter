import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

/// A skeleton list used while a search/favorites request is in flight,
/// so the UI never shows a blank screen or a plain spinner.
class ShimmerRepoList extends StatelessWidget {
  const ShimmerRepoList({this.itemCount = 6, super.key});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final Color base = isDark ? Colors.grey.shade800 : Colors.grey.shade300;
    final Color highlight = isDark ? Colors.grey.shade700 : Colors.grey.shade100;

    return Shimmer.fromColors(
      baseColor: base,
      highlightColor: highlight,
      child: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: itemCount,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (_, __) => Container(
          height: 96,
          decoration: BoxDecoration(
            color: base,
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }
}
