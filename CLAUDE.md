# CLAUDE.md

This file provides guidance for AI assistants working with the `page_animation_transition` Flutter package.

## Project Overview

`page_animation_transition` is a lightweight Flutter package (v0.1.0) that provides 15 pre-built animated page transitions. It exposes a single `PageAnimationTransition` widget (which extends `PageRouteBuilder`) and an abstract interface for defining custom transitions.

- **Repository**: https://github.com/aayushkedawat/page_animation_transition
- **License**: MIT
- **Dart SDK**: >=2.12.1 <3.0.0 (null safety required)
- **Flutter SDK**: >=1.17.0

---

## Repository Structure

```
page_animation_transition/
├── lib/                                    # Published package source
│   ├── page_animation_transition.dart     # Main widget (NOT a barrel file)
│   ├── page_animation_interface.dart      # Abstract interface
│   └── animations/                        # 15 animation implementations
│       ├── bottom_to_top_transition.dart
│       ├── top_to_bottom_transition.dart
│       ├── left_to_right_transition.dart
│       ├── right_to_left_transition.dart
│       ├── fade_animation_transition.dart
│       ├── scale_animation_transition.dart
│       ├── rotate_animation_transition.dart
│       ├── bottom_to_top_faded_transition.dart
│       ├── top_to_bottom_faded.dart          # ⚠ intentionally missing _transition suffix
│       ├── left_to_right_faded_transition.dart
│       ├── right_to_left_faded_transition.dart
│       ├── flip_transition.dart
│       ├── scale_fade_transition.dart
│       ├── size_animation_transition.dart
│       └── platform_adaptive_transition.dart
├── example/                                # Runnable Flutter demo app
│   ├── lib/
│   │   ├── main.dart                      # App entry point
│   │   ├── page_one.dart                  # Demo page with all 11 transitions
│   │   └── page_two.dart                  # Destination page
│   └── test/
│       └── widget_test.dart               # Placeholder — does NOT test animations
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
  Widget animate(
    BuildContext context,                  // ← always the first parameter
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  );
}
```

The main widget overrides `buildTransitions` and delegates to the interface. It also exposes `curve` and `duration` for convenient customization:

```dart
// lib/page_animation_transition.dart
class PageAnimationTransition extends PageRouteBuilder {
  final Widget page;
  final PageAnimationInterface pageAnimationType;
  final Curve curve;

  PageAnimationTransition({
    required this.page,
    required this.pageAnimationType,
    this.curve = Curves.linear,
    Duration duration = const Duration(milliseconds: 300),
  }) : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionDuration: duration,
        );

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return pageAnimationType.animate(
      context,
      CurvedAnimation(parent: animation, curve: curve),
      secondaryAnimation,
      child,
    );
  }
}
```

The `curve` is applied in `buildTransitions` by wrapping the raw `animation` with `CurvedAnimation` before passing it to `animate()`. This means individual animation classes do not need to know about curves — they always receive a pre-curved animation.

### Import Pattern

There is **no barrel file**. Consumers import each animation directly from its path:

```dart
import 'package:page_animation_transition/page_animation_transition.dart';
import 'package:page_animation_transition/animations/bottom_to_top_transition.dart';
```

See `example/lib/page_one.dart` for a full list of working import statements.

### Concrete Animation Example

Here is `BottomToTopTransition` — the simplest slide implementation, use it as a template:

```dart
import 'package:flutter/material.dart';
import 'package:page_animation_transition/page_animation_interface.dart';

class BottomToTopTransition implements PageAnimationInterface {
  @override
  Widget animate(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return SlideTransition(
      position: Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
          .animate(animation),
      child: child,
    );
  }
}
```

For a **faded slide**, wrap `child` in a `FadeTransition` before passing to `SlideTransition`:

```dart
return SlideTransition(
  position: Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
      .animate(animation),
  child: FadeTransition(
    opacity: Tween<double>(begin: 0, end: 1).animate(animation),
    child: child,
  ),
);
```

### Slide Direction — Offset Reference

`SlideTransition` uses fractional offsets relative to the screen size. All animations animate **from** `begin` **to** `Offset.zero` (resting position):

| Direction (incoming page enters from…) | `begin` Offset |
|---|---|
| Bottom (slides up) | `Offset(0, 1)` |
| Top (slides down) | `Offset(0, -1)` |
| Right (slides left) | `Offset(1, 0)` |
| Left (slides right) | `Offset(-1, 0)` |

### Adding a New Animation

1. Create `lib/animations/your_transition_name.dart` (one class per file, `snake_case` filename).
2. Implement `PageAnimationInterface` with all **four** parameters in `animate()`.
3. Use only Flutter built-in widgets (`SlideTransition`, `FadeTransition`, `ScaleTransition`, `RotationTransition`). No new dependencies.
4. Add a demo button in `example/lib/page_one.dart` and the corresponding import.
5. Document in `README.md` and `CHANGELOG.md`.

> There is no barrel file to update. Do not add an export to `lib/page_animation_transition.dart`.

---

## Available Transition Types

| Class | File | Effect |
|---|---|---|
| `BottomToTopTransition` | `bottom_to_top_transition.dart` | Slide from bottom |
| `TopToBottomTransition` | `top_to_bottom_transition.dart` | Slide from top |
| `LeftToRightTransition` | `left_to_right_transition.dart` | Slide from left |
| `RightToLeftTransition` | `right_to_left_transition.dart` | Slide from right |
| `FadeAnimationTransition` | `fade_animation_transition.dart` | Fade in/out |
| `ScaleAnimationTransition` | `scale_animation_transition.dart` | Scale in/out |
| `RotationAnimationTransition` | `rotate_animation_transition.dart` | Rotation |
| `BottomToTopFadedTransition` | `bottom_to_top_faded_transition.dart` | Slide bottom + fade |
| `TopToBottomFadedTransition` | `top_to_bottom_faded.dart` | Slide top + fade |
| `LeftToRightFadedTransition` | `left_to_right_faded_transition.dart` | Slide left + fade |
| `RightToLeftFadedTransition` | `right_to_left_faded_transition.dart` | Slide right + fade |
| `FlipTransition` | `flip_transition.dart` | 3D perspective Y-axis flip |
| `ScaleFadeTransition` | `scale_fade_transition.dart` | Scale + fade combined |
| `SizeAnimationTransition` | `size_animation_transition.dart` | Expand/collapse via SizeTransition |
| `PlatformAdaptiveTransition` | `platform_adaptive_transition.dart` | Right-to-left on iOS/macOS; bottom-to-top fade elsewhere |

---

## Known Quirks & Gotchas

- **`top_to_bottom_faded.dart` filename**: This file is missing the `_transition` suffix that all other faded variants use. This is intentional (it already exists in pub.dev releases). Do **not** rename it — doing so will break all existing consumer imports.
- **`curve` wrapping happens in `buildTransitions`**: Individual animation classes always receive a `CurvedAnimation`, not the raw `Animation<double>`. Do not apply extra curves inside animation classes.
- **`widget_test.dart` is dead code**: `example/test/widget_test.dart` contains the default Flutter counter test, not an animation test. It passes only because it pumps the `MyApp` widget from a non-existent counter template. Do not rely on it for validation.
- **`PlatformAdaptiveTransition` uses `Theme.of(context).platform`**: This is intentional — it works on web and all platforms without needing `dart:io`. Do not switch it to `Platform.isIOS`.

---

## What NOT To Do

Avoid these common mistakes when modifying this package:

- **Do not add runtime dependencies** to `pubspec.yaml`. The package intentionally has zero third-party dependencies.
- **Do not change the `animate()` signature** — the interface defines exactly 4 parameters (`context`, `animation`, `secondaryAnimation`, `child`). Adding or removing parameters breaks all existing implementations.
- **Do not put two animation classes in one file**. One class = one file, always.
- **Do not add an export/part directive** to `lib/page_animation_transition.dart`. It is a widget file, not a barrel.
- **Do not rename `top_to_bottom_faded.dart`** to add the `_transition` suffix. It would break consumer imports.
- **Do not use `!` force-unwrap** unless provably non-null; prefer `??` and `?.`.

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

All code must pass `flutter analyze` with **zero warnings** before committing.

### Tests

```bash
# Run from example/
cd example && flutter test
```

> The existing `example/test/widget_test.dart` is a placeholder smoke test that does not test animation behavior. New tests should be added here or in a dedicated `test/` directory at the package root.

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
- **Interface compliance**: Every new animation class must implement `PageAnimationInterface` with the exact 4-parameter `animate()` signature.

---

## Branch Strategy

- `main` — stable, published releases
- `develop` — integration branch; merged into `main` via PRs
- Feature branches merge into `develop`

---

## Key Files to Know

| File | Purpose |
|---|---|
| `lib/page_animation_transition.dart` | Main widget; overrides `buildTransitions` to call the interface |
| `lib/page_animation_interface.dart` | Abstract contract every animation must satisfy |
| `lib/animations/*.dart` | Individual animation implementations |
| `example/lib/page_one.dart` | Best reference for correct imports and usage of every animation |
| `pubspec.yaml` | Package version, SDK constraints, dependencies |
| `CHANGELOG.md` | Must be updated with every release |
| `README.md` | User-facing docs; update when adding new animation types |
