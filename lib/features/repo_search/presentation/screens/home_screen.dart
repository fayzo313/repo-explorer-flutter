import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/utils/debouncer.dart';
import '../../../../core/widgets/app_empty_widget.dart';
import '../../../../core/widgets/app_error_widget.dart';
import '../../../../core/widgets/shimmer_loading.dart';
import '../../../../routes/route_names.dart';
import '../../../favorites/presentation/providers/favorites_provider.dart';
import '../providers/repo_search_notifier.dart';
import '../providers/repo_search_state.dart';
import '../widgets/repo_card.dart';
import '../widgets/search_bar_widget.dart';

/// The primary "Explore" screen: search GitHub, browse popular repos by
/// default, pull-to-refresh, infinite scroll, and favorite from the
/// list without leaving it.
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final Debouncer _debouncer = Debouncer(AppConstants.searchDebounce);
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _debouncer.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      ref.read(repoSearchNotifierProvider.notifier).loadMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    final RepoSearchState state = ref.watch(repoSearchNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Explore')),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
        child: Column(
          children: [
            SearchBarWidget(
              onChanged: (value) {
                _debouncer.run(
                  () => ref.read(repoSearchNotifierProvider.notifier).search(value),
                );
              },
              onSubmitted: (value) =>
                  ref.read(repoSearchNotifierProvider.notifier).search(value),
            ),
            const SizedBox(height: 12),
            if (state.isOffline) _OfflineBanner(message: state.errorMessage),
            Expanded(child: _buildBody(state)),
          ],
        ),
      ),
    );
  }

  Widget _buildBody(RepoSearchState state) {
    if (state.isLoading) {
      return const ShimmerRepoList();
    }

    if (state.errorMessage != null && state.results.isEmpty) {
      return AppErrorWidget(
        message: state.errorMessage!,
        onRetry: () => ref.read(repoSearchNotifierProvider.notifier).refresh(),
      );
    }

    if (state.isEmpty) {
      return const AppEmptyWidget(
        title: 'No repositories found',
        subtitle: 'Try a different search term, like "flutter" or "riverpod".',
        icon: Icons.search_off_rounded,
      );
    }

    return RefreshIndicator(
      onRefresh: () => ref.read(repoSearchNotifierProvider.notifier).refresh(),
      child: ListView.separated(
        controller: _scrollController,
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: state.results.length + (state.isLoadingMore ? 1 : 0),
        separatorBuilder: (_, __) => const SizedBox(height: 10),
        itemBuilder: (context, index) {
          if (index >= state.results.length) {
            return const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Center(child: CircularProgressIndicator()),
            );
          }
          final repo = state.results[index];
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
  }
}

class _OfflineBanner extends StatelessWidget {
  const _OfflineBanner({this.message});

  final String? message;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: colors.errorContainer.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(Icons.wifi_off_rounded, size: 18, color: colors.onErrorContainer),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              message ?? 'You\'re offline - showing cached results.',
              style: TextStyle(fontSize: 12, color: colors.onErrorContainer),
            ),
          ),
        ],
      ),
    );
  }
}
