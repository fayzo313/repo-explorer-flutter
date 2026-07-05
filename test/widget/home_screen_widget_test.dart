import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_repo_explorer/core/utils/result.dart';
import 'package:github_repo_explorer/features/repo_search/domain/entities/github_repo.dart';
import 'package:github_repo_explorer/features/repo_search/domain/usecases/search_repositories_usecase.dart';
import 'package:github_repo_explorer/features/repo_search/presentation/providers/repo_providers.dart';
import 'package:github_repo_explorer/features/repo_search/presentation/screens/home_screen.dart';
import 'package:mocktail/mocktail.dart';

class _MockSearchUseCase extends Mock implements SearchRepositoriesUseCase {}

void main() {
  testWidgets('HomeScreen shows a repo card once the search use case resolves',
      (WidgetTester tester) async {
    final _MockSearchUseCase useCase = _MockSearchUseCase();
    final GithubRepo repo = GithubRepo(
      id: 1,
      name: 'flutter',
      fullName: 'flutter/flutter',
      ownerLogin: 'flutter',
      ownerAvatarUrl: 'https://x/y.png',
      stars: 150000,
      forks: 26000,
      htmlUrl: 'https://github.com/flutter/flutter',
      updatedAt: DateTime(2026, 1, 1),
      description: "Flutter makes it easy and fast to build apps.",
    );

    when(() => useCase(query: any(named: 'query'), page: any(named: 'page')))
        .thenAnswer((_) async => Result.success([repo]));

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          searchRepositoriesUseCaseProvider.overrideWithValue(useCase),
        ],
        child: const MaterialApp(home: HomeScreen()),
      ),
    );

    // First frame: shimmer/loading placeholder is shown, not the result.
    await tester.pump();
    expect(find.text('flutter'), findsNothing);

    // Let the async search microtask + future resolve.
    await tester.pumpAndSettle();

    expect(find.text('flutter'), findsOneWidget);
    expect(find.textContaining('Flutter makes it easy'), findsOneWidget);
  });
}
