# CLAUDE.md

This file provides guidance for AI assistants working with the `page_animation_transition` Flutter package.

## Project Overview

`page_animation_transition` is a lightweight Flutter package (v0.0.9) that provides 11 pre-built animated page transitions. It exposes a single `PageAnimationTransition` widget (which extends `PageRouteBuilder`) and an abstract interface for defining custom transitions.

- **Repository**: https://github.com/aayushkedawat/page_animation_transition
- **License**: MIT
- **Dart SDK**: >=2.12.1 <3.0.0 (null safety required)
- **Flutter SDK**: >=1.17.0

---

## Repository Structure

```
page_animation_transition/
├── lib/                                    # Published package source
│   ├── page_animation_transition.dart     # Main widget (entry point)
│   ├── page_animation_interface.dart      # Abstract interface
│   └── animations/                        # 11 animation implementations
│       ├── bottom_to_top_transition.dart
│       ├── top_to_bottom_transition.dart
│       ├── left_to_right_transition.dart
│       ├── right_to_left_transition.dart
│       ├── fade_animation_transition.dart
│       ├── scale_animation_transition.dart
│       ├── rotate_animation_transition.dart
│       ├── bottom_to_top_faded_transition.dart
│       ├── top_to_bottom_faded.dart
│       ├── left_to_right_faded_transition.dart
│       └── right_to_left_faded_transition.dart
├── example/                                # Runnable Flutter demo app
│   ├── lib/
│   │   ├── main.dart                      # App entry point
│   │   ├── page_one.dart                  # Demo page with all 11 transitions
│   │   └── page_two.dart                  # Destination page
│   └── test/
│       └── widget_test.dart               # Basic smoke test
├── pubspec.yaml                           # Package metadata & dependencies
├── pubspec.lock                           # Locked dependency versions
├── CHANGELOG.md                           # Version history
├── README.md                              # User-facing documentation
├── LICENSE                                # MIT License
└── analysis_options.yaml                  # Dart linter configuration
```

---

## Architecture

### Core Pattern: Strategy via Interface

All animation types implement the `PageAnimationInterface` abstract class:

```dart
// lib/page_animation_interface.dart
abstract class PageAnimationInterface {
  Widget animate(Animation<double> animation, Animation<double> secondaryAnimation, Widget child);
}
```

The main widget delegates to the interface:

```dart
// lib/page_animation_transition.dart
class PageAnimationTransition extends PageRouteBuilder {
  final Widget page;
  final PageAnimationInterface pageAnimationType;

  PageAnimationTransition({required this.page, required this.pageAnimationType})
      : super(
          pageBuilder: (_, __, ___) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              pageAnimationType.animate(animation, secondaryAnimation, child),
        );
}
```

### Adding a New Animation

1. Create a new file in `lib/animations/`.
2. Define a class implementing `PageAnimationInterface`.
3. Implement the `animate()` method using Flutter's built-in transition widgets (`SlideTransition`, `FadeTransition`, `ScaleTransition`, `RotationTransition`).
4. Export the new class from `lib/page_animation_transition.dart` (check the existing barrel export pattern).
5. Add a demo button in `example/lib/page_one.dart`.
6. Document the new type in `README.md` and `CHANGELOG.md`.

---

## Available Transition Types

| Class | Effect |
|---|---|
| `BottomToTopTransition` | Slide from bottom |
| `TopToBottomTransition` | Slide from top |
| `LeftToRightTransition` | Slide from left |
| `RightToLeftTransition` | Slide from right |
| `FadeAnimationTransition` | Fade in/out |
| `ScaleAnimationTransition` | Scale in/out |
| `RotateAnimationTransition` | Rotation |
| `BottomToTopFadedTransition` | Slide bottom + fade |
| `TopToBottomFadedTransition` | Slide top + fade |
| `LeftToRightFadedTransition` | Slide left + fade |
| `RightToLeftFadedTransition` | Slide right + fade |

---

## Development Workflows

### Setup

```bash
# Install package dependencies
flutter pub get

# Install example app dependencies
cd example && flutter pub get
```

### Run the Example App

```bash
cd example
flutter run
```

### Static Analysis

```bash
# Run from repo root (analyzes lib/)
flutter analyze

# Run from example/ (analyzes example app)
cd example && flutter analyze
```

### Tests

```bash
# Run from example/
cd example && flutter test
```

> **Note**: The existing `example/test/widget_test.dart` is a placeholder smoke test and does not test animation behavior. New tests should be added here or in a dedicated `test/` directory at the package root.

### Versioning & Publishing

This package is published to [pub.dev](https://pub.dev/packages/page_animation_transition).

Before publishing:
1. Bump `version` in `pubspec.yaml`.
2. Add an entry to `CHANGELOG.md`.
3. Run `flutter pub publish --dry-run` to validate.
4. Run `flutter pub publish` to publish.

---

## Code Conventions

- **Null safety**: All code must be null-safe (Dart 2.12+). Avoid `!` force-unwrap unless unavoidable; prefer `??` and `?.`.
- **Naming**: Use `lowerCamelCase` for variables/methods, `UpperCamelCase` for classes, `snake_case` for file names.
- **Animation classes**: Each animation lives in its own file. Keep them single-responsibility — one class, one file.
- **No external dependencies**: The package intentionally has zero runtime dependencies beyond the Flutter SDK. Do not add third-party packages to `dependencies` in `pubspec.yaml`.
- **Linting**: Code must pass `flutter analyze` with zero warnings. The project uses `flutter_lints` (see `analysis_options.yaml`).
- **Interface compliance**: Every new animation class must implement `PageAnimationInterface`. Do not add optional parameters to `animate()`.

---

## Branch Strategy

- `main` — stable, published releases
- `develop` — integration branch; merged into `main` via PRs
- Feature branches merge into `develop`

---

## Key Files to Know

| File | Purpose |
|---|---|
| `lib/page_animation_transition.dart` | Package entry point; barrel exports all public types |
| `lib/page_animation_interface.dart` | Abstract contract every animation must satisfy |
| `lib/animations/*.dart` | Individual animation implementations |
| `example/lib/page_one.dart` | Best reference for how to use every animation type |
| `pubspec.yaml` | Package version, SDK constraints, dependencies |
| `CHANGELOG.md` | Must be updated with every release |
| `README.md` | User-facing docs; update when adding new animation types |
