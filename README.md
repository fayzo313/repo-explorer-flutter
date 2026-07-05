# 🔭 Repo Explorer

A small, production-quality Flutter app for discovering GitHub repositories, inspecting their details, and saving favorites for **offline** access.

Built as a portfolio piece to demonstrate **Clean Architecture, the Repository Pattern, and idiomatic Riverpod** in a codebase small enough to read end-to-end in one sitting.

> **Why this idea?** It's a real, useful tool (not a to-do app clone), needs zero authentication, is instantly understandable in a 30-second video, and its data shape (search → cache → favorite → offline) naturally exercises every architectural requirement below.

---

## ✨ Features

- 🔍 Search any GitHub repository, or browse a "popular right now" feed by default
- 📄 Repository detail view (stars, forks, language, last updated, open on GitHub)
- ⭐ Favorite repositories, available fully offline afterwards
- 📡 Offline-first: search results are cached; if you go offline, the last results for that query are shown with a banner instead of a blank screen
- 🔄 Pull-to-refresh and infinite scroll pagination
- 💀 Shimmer skeleton loading, empty states, and error states with retry — every screen, every state
- 🌗 Full Material 3 light + dark theme
- 🧪 Unit tests for the repository, a Riverpod provider test, and a widget test

---

## 🧱 Architecture

```
lib/
  core/                     # Cross-cutting, framework-facing code
    constants/              # API + app constants
    database/               # Drift schema (tables + generated AppDatabase)
    error/                  # Exceptions (data layer) & Failures (domain-safe)
    network/                # Dio client, connectivity check
    providers/              # Low-level DI: Dio, AppDatabase, NetworkInfo
    theme/                  # Colors, text styles, ThemeData
    utils/                  # Result<T>, Debouncer
    widgets/                # AppErrorWidget, AppEmptyWidget, ShimmerRepoList...

  features/
    splash/
      presentation/screens/
    repo_search/            # "Explore" — search + browse
      data/
        datasources/        # GithubRemoteDataSource, RepoLocalDataSource
        models/              # GithubRepoModel (Freezed + json_serializable)
        repositories/        # RepoRepositoryImpl
      domain/
        entities/            # GithubRepo (pure Dart, Freezed)
        repositories/         # RepoRepository (abstract interface)
        usecases/             # SearchRepositoriesUseCase
      presentation/
        providers/            # repo_providers (DI), state, Notifier
        screens/              # HomeScreen
        widgets/              # RepoCard, SearchBarWidget
    repo_details/
      presentation/
        providers/            # FutureProvider.family details lookup
        screens/              # RepoDetailsScreen
    favorites/
      domain/usecases/        # ToggleFavoriteUseCase, GetFavoritesUseCase
      presentation/
        providers/            # AsyncNotifier + Provider.family
        screens/              # FavoritesScreen

  shared/widgets/            # MainShell (bottom nav)
  routes/                    # GoRouter config + route name/path constants
  main.dart
```

### Why Clean Architecture, concretely

Each feature is split into three layers with a strict dependency direction: **presentation → domain ← data**. Domain never imports Flutter, Dio, or Drift.

| Layer | Knows about | Never imports |
|---|---|---|
| **Domain** (`entities`, `repositories`, `usecases`) | Plain Dart only | `dio`, `drift`, `flutter`, `flutter_riverpod` |
| **Data** (`models`, `datasources`, `repositories`) | The domain contracts it implements | Presentation, Riverpod |
| **Presentation** (`providers`, `screens`, `widgets`) | Domain entities & use cases | Data layer concrete classes |

This is what makes the project **testable and swappable**: `repo_repository_impl_test.dart` mocks `GithubRemoteDataSource`/`RepoLocalDataSource`/`NetworkInfo` — three interfaces — with zero real network or disk I/O. If GitHub's API were replaced by GitLab tomorrow, only `data/` would change.

### Repository Pattern in this project

`RepoRepositoryImpl` is the **only** class that knows both the network and the database exist. It implements a stale-while-revalidate-ish policy:

1. Check connectivity (`NetworkInfo`).
2. **Online:** call the GitHub API → best-effort write-through cache → merge in favorite status → return `Result.success`.
3. **Offline:** read whatever was cached for that exact query; if nothing was ever cached for it, return a `NetworkFailure` with a clear message.

Everything the repository returns is a `Result<T>` (`Success<T>` | `Failure_<T>`), a tiny sealed-class Either — no exceptions cross the domain/presentation boundary, so a `try/catch` never has to guess *why* a call failed.

### Dependency Injection

There's no `get_it` / `injectable` here — **Riverpod itself is the DI container**. Every provider is constructed from the providers below it (`dioProvider` → `githubRemoteDataSourceProvider` → `repoRepositoryProvider` → `searchRepositoriesUseCaseProvider`), and tests override exactly the seam they need with `ProviderContainer(overrides: [...])`. This keeps the dependency graph declarative, lazy, and disposable (`ref.onDispose(db.close)` closes the SQLite connection automatically).

---

## 🧩 Riverpod patterns demonstrated

| Pattern | Where | Why this one |
|---|---|---|
| `Provider` (plain DI) | `core_providers.dart`, `repo_providers.dart` | Wiring Dio/Drift/NetworkInfo/use cases — no state, just construction |
| `Notifier<T>` | `RepoSearchNotifier` | Search screen state has multiple orthogonal flags (loading, loading-more, offline, error) that don't map cleanly onto one `AsyncValue` |
| `AsyncNotifier<T>` | `FavoritesNotifier` | Favorites *is* just "a list that's loading/loaded/errored" — the textbook `AsyncValue` shape, plus an optimistic `toggle()` mutation |
| `FutureProvider.family<T, Arg>` | `repoDetailsProvider(repoId)` | One-shot async lookup keyed by an id, no further mutation |
| `Provider.family<T, Arg>` | `isRepoFavoriteProvider(repoId)` | Cheap, memoized derived boolean per repo id, without exposing the whole favorites list to every card |
| `ref.watch` vs `ref.read` | Throughout | `watch` in `build()`/widget `build()` for reactive re-renders; `read` inside notifier methods and event handlers to avoid rebuild loops |
| `AsyncValue.guard` | `FavoritesNotifier.refresh()` | Safely re-runs an async operation while preserving the previous value during reload (`copyWithPrevious`) |

State classes (`RepoSearchState`) are modeled with **Freezed** so "impossible states" (e.g. `isLoading: true` *and* a stale error message) are avoided via `copyWith` producing a whole new consistent object every time.

---

## 🌐 API

[GitHub REST API — Search Repositories](https://docs.github.com/en/rest/search/search#search-repositories) (`GET /search/repositories`). No authentication required for the request volume this demo needs (60 requests/hour unauthenticated; add a personal access token to `assets/env/.env` to raise that to 5,000/hour).

## 💾 Local storage: why Drift

The brief allows Hive/Isar or Drift; **Drift** (type-safe SQL over SQLite) was chosen because:

- It gives compile-time-checked queries (`OrderingTerm.desc(t.stars)`, `where((t) => t.id.equals(...))`) instead of hand-rolled key lookups.
- Two clearly relational tables (`CachedRepositories` keyed by `(id, searchQuery)`, `FavoriteRepositories` keyed by `id`) map naturally onto SQL rather than a document store.
- It's the option most directly comparable to what a Senior Flutter Developer would reach for on a real backend-adjacent team, and it demonstrates schema migrations (`schemaVersion`), transactions, and DAOs — all good interview talking points.

---

## 🚀 Getting started

```bash
flutter --version        # tested against Flutter 3.22+, Dart 3.4+
flutter pub get

# Generates *.freezed.dart, *.g.dart (json_serializable), and the Drift
# database code (app_database.g.dart) from the annotations in this repo.
dart run build_runner build --delete-conflicting-outputs

flutter run
```

### Optional: raise your GitHub rate limit

Edit `assets/env/.env`:

```
GITHUB_BASE_URL=https://api.github.com
GITHUB_TOKEN=ghp_yourPersonalAccessTokenHere
```

No scopes are required — a plain classic token is enough to read public search results at the higher authenticated rate limit.

### Running tests

```bash
flutter test
```

Covers:
- `test/features/repo_search/data/repositories/repo_repository_impl_test.dart` — repository logic (online/offline/cache/favorite-merging/error-mapping), fully mocked
- `test/features/repo_search/presentation/providers/repo_search_notifier_test.dart` — `Notifier` behavior via `ProviderContainer` + provider overrides
- `test/widget/home_screen_widget_test.dart` — Home screen renders loading → data with a mocked use case

---

## 📦 Git commit suggestions

If you're recreating this project's history for your portfolio, here's a sensible commit sequence:

```
chore: scaffold Flutter project and folder structure
feat(core): add theme, constants, error types, and Result<T>
feat(core): add Dio client, NetworkInfo, and Drift database schema
feat(repo_search): add GithubRepo entity and GithubRepoModel (Freezed)
feat(repo_search): implement remote and local data sources
feat(repo_search): implement RepoRepository and RepoRepositoryImpl
feat(repo_search): add SearchRepositoriesUseCase
feat(repo_search): add RepoSearchNotifier and search state
feat(repo_search): build HomeScreen with search, pagination, pull-to-refresh
feat(favorites): add favorites use cases and AsyncNotifier
feat(favorites): build FavoritesScreen
feat(repo_details): add FutureProvider.family details lookup and screen
feat(navigation): configure GoRouter with StatefulShellRoute bottom nav
feat(splash): add SplashScreen
test(repo_search): add repository, provider, and widget tests
docs: add README with architecture and Riverpod explanation
```

---

## 📱 Suggested screenshots for GitHub/LinkedIn

1. **Splash screen** — branded loading moment
2. **Home / Explore** — populated list with stars/forks/language chips
3. **Search in action** — search bar with a specific query and filtered results
4. **Repository details** — hero header, stats, "Open on GitHub" button
5. **Favorites screen** — a couple of saved repos
6. **Offline banner** — airplane mode on, cached results still visible
7. **Dark mode** — same Home screen, dark theme
8. **Empty state** — a nonsense search query showing "No repositories found"

---

## 💼 LinkedIn post content

> 🚀 New portfolio project: **Repo Explorer** — a GitHub repository browser built with Flutter.
>
> I wanted a project that showcased *engineering*, not just UI, so I focused on getting the architecture right:
>
> ✅ Clean Architecture (data / domain / presentation, strict dependency direction)
> ✅ Repository Pattern with an offline-first cache (Drift/SQLite)
> ✅ Riverpod — Notifier, AsyncNotifier, FutureProvider.family, Provider.family, all in one small app
> ✅ Freezed + json_serializable models, GoRouter navigation, Material 3 light/dark themes
> ✅ Unit + widget tests
>
> It searches the public GitHub API, caches results locally, and lets you save favorites that work fully offline. No auth required to run it.
>
> Code + README (with architecture breakdown): [GitHub link]
>
> #Flutter #Dart #Riverpod #CleanArchitecture #MobileDevelopment #SoftwareEngineering

---

## 🎬 30–60 second demo video script

**[0:00–0:05]** Open on Splash screen (branded icon + app name), quick fade to Home.

**[0:05–0:15]** Home screen already populated with popular repos. Scroll down a bit to show pagination loading more, then pull-to-refresh.

**[0:15–0:25]** Type "riverpod" into the search bar — show the shimmer skeleton flash briefly, then results update. Tap a result.

**[0:25–0:35]** Details screen: point out stars/forks/language, tap "Open on GitHub" briefly (or narrate it), go back.

**[0:35–0:45]** Tap the star icon on a repo card to favorite it. Switch to the Favorites tab — it's there.

**[0:45–0:55]** Toggle airplane mode / Wi-Fi off. Go back to Home, do a search you already ran — cached results still appear with the offline banner. Toggle dark mode via system settings to show theming.

**[0:55–0:60]** End on the Favorites tab or app icon with a title card: "Repo Explorer — Flutter, Riverpod, Clean Architecture."

---

## 🎤 Interview questions this project sets you up for

**Architecture**
- Why did you split the app into data/domain/presentation instead of a simpler `screens/` + `services/` structure?
- What would it cost to swap the GitHub API for GitLab's? Which files change?
- Why does the domain layer define `RepoRepository` as an abstract interface instead of just calling `RepoRepositoryImpl` directly?

**Riverpod**
- Why is `RepoSearchNotifier` a plain `Notifier` while `FavoritesNotifier` is an `AsyncNotifier` — what's the actual deciding factor?
- Walk me through what happens, provider-by-provider, when a user types a search query.
- What's the difference between `ref.watch` and `ref.read`, and where in this app would using the wrong one cause a bug?
- How does `Provider.family` avoid rebuilding every repo card when one favorite changes?

**Data & offline**
- Why is `Result<T>` used instead of throwing exceptions out of the repository?
- Explain the online/offline branching in `RepoRepositoryImpl.searchRepositories` — what happens if the device is online but the GitHub API itself is down?
- Why cache by `(id, searchQuery)` compound key instead of just `id`?

**Testing**
- How were `GithubRemoteDataSource` and `RepoLocalDataSource` mocked in the repository test, and why does that matter?
- How do you test a `Notifier` without spinning up widgets?

**General**
- What would you add next if this were a real product, not a portfolio piece (pagination cursor vs page number, rate-limit backoff, token refresh, etc.)?
- Where are the SOLID principles most visible in this codebase?

---

## 🛠 Tech stack

Flutter 3.22+ · Dart 3.4+ · Riverpod 2.x · GoRouter · Drift · Freezed · json_serializable · Dio · flutter_dotenv · shimmer · cached_network_image · connectivity_plus · mocktail
