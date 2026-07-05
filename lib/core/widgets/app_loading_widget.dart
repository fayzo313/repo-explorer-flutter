import 'package:flutter/material.dart';

/// Simple centered spinner for smaller, non-list loading contexts
/// (e.g. the details screen). List screens prefer [ShimmerRepoList]
/// for a more polished perceived-performance effect.
class AppLoadingWidget extends StatelessWidget {
  const AppLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
