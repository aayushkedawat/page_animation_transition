# page_animation_transition

[![pub package](https://img.shields.io/pub/v/page_animation_transition.svg)](https://pub.dev/packages/page_animation_transition)
[![pub points](https://img.shields.io/pub/points/page_animation_transition)](https://pub.dev/packages/page_animation_transition/score)
[![pub likes](https://img.shields.io/pub/likes/page_animation_transition)](https://pub.dev/packages/page_animation_transition/score)
[![pub popularity](https://img.shields.io/pub/popularity/page_animation_transition)](https://pub.dev/packages/page_animation_transition/score)
[![License: MIT](https://img.shields.io/github/license/aayushkedawat/page_animation_transition)](LICENSE)
[![platform](https://img.shields.io/badge/platform-flutter-02569B?logo=flutter)](https://flutter.dev)

**A lightweight Flutter package for adding beautiful, customizable page route
transition animations** — slide, fade, scale, rotate, size, and diagonal
transitions — to `Navigator.push` and named routes, with full control over
duration and easing curves. No boilerplate `PageRouteBuilder` code required.

If you're searching for a **Flutter page transition animation package**,
**custom Flutter route transition**, or a simple way to **animate Navigator
push/pop transitions**, this package gets you there in one line of code.

## Table of contents

- [Why page_animation_transition?](#why-page_animation_transition)
- [Installation](#installation)
- [Quick start](#quick-start)
- [Available transitions](#available-transitions)
- [Customizing duration and curves](#customizing-duration-and-curves)
- [Using with named routes](#using-with-named-routes)
- [Example app](#example-app)
- [FAQ](#faq)
- [Contributing](#contributing)
- [License](#license)

## Why page_animation_transition?

- **18 ready-made transitions** — slide (4 directions), slide + fade, fade,
  scale, scale + fade, rotate, rotate + fade, size, and 4 diagonal slides —
  covering the vast majority of page-transition needs out of the box.
- **One-line usage** — wrap any `page` in `PageAnimationTransition` instead of
  hand-rolling a `PageRouteBuilder` with `Tween`s and `AnimatedBuilder`s.
- **Fully customizable timing** — set `duration`, `reverseDuration`, `curve`,
  and `reverseCurve` per navigation call, so transitions match your app's
  motion design instead of a fixed default.
- **Works with both imperative and named routing** — use it directly with
  `Navigator.push` or return it from `onGenerateRoute` for named routes.
- **Zero extra dependencies** — built entirely on Flutter's own
  `PageRouteBuilder`, `Tween`, and transition widgets, so it stays small and
  has nothing extra to break or bloat your app.
- **Extensible** — implement `PageAnimationInterface` to plug in your own
  custom transition alongside the built-in ones.

## Installation

Add `page_animation_transition` to your `pubspec.yaml`:

```yaml
dependencies:
  page_animation_transition: ^latest_version
```

Then fetch it:

```
flutter pub get
```

A single import gives you `PageAnimationTransition` and every transition type:

```dart
import 'package:page_animation_transition/page_animation_transition.dart';
```

## Quick start

```dart
Navigator.of(context).push(
  PageAnimationTransition(
    page: const PageTwo(),
    pageAnimationType: LeftToRightTransition(),
  ),
);
```

That's it — no custom `PageRouteBuilder`, no manual `Tween` setup.

## Available transitions

| Transition class                    | Effect                                                   |
|--------------------------------------|-----------------------------------------------------------|
| `BottomToTopTransition`              | Slides the new page up from the bottom of the screen      |
| `TopToBottomTransition`              | Slides the new page down from the top of the screen       |
| `LeftToRightTransition`              | Slides the new page in from the left edge                 |
| `RightToLeftTransition`              | Slides the new page in from the right edge                |
| `BottomToTopFadedTransition`         | Slide up combined with a fade-in                           |
| `TopToBottomFadedTransition`         | Slide down combined with a fade-in                          |
| `LeftToRightFadedTransition`         | Slide-in from the left combined with a fade-in              |
| `RightToLeftFadedTransition`         | Slide-in from the right combined with a fade-in             |
| `FadeAnimationTransition`            | Simple cross-fade / opacity transition                     |
| `ScaleAnimationTransition`           | Zooms the new page in from a point                          |
| `ScaleFadedTransition`               | Zoom-in combined with a fade-in                             |
| `RotationAnimationTransition`        | Rotates the new page into view                              |
| `RotationFadedTransition`            | Rotation combined with a fade-in                            |
| `SizeAnimationTransition`            | Expands the new page into view along an axis                |
| `TopLeftToBottomRightTransition`     | Diagonal slide from the top-left corner                     |
| `TopRightToBottomLeftTransition`     | Diagonal slide from the top-right corner                    |
| `BottomLeftToTopRightTransition`     | Diagonal slide from the bottom-left corner                  |
| `BottomRightToTopLeftTransition`     | Diagonal slide from the bottom-right corner                 |

```dart
Navigator.of(context).push(PageAnimationTransition(page: const PageTwo(), pageAnimationType: BottomToTopTransition()));

Navigator.of(context).push(PageAnimationTransition(page: const PageTwo(), pageAnimationType: TopToBottomTransition()));

Navigator.of(context).push(PageAnimationTransition(page: const PageTwo(), pageAnimationType: RightToLeftTransition()));

Navigator.of(context).push(PageAnimationTransition(page: const PageTwo(), pageAnimationType: LeftToRightTransition()));

Navigator.of(context).push(PageAnimationTransition(page: const PageTwo(), pageAnimationType: FadeAnimationTransition()));

Navigator.of(context).push(PageAnimationTransition(page: const PageTwo(), pageAnimationType: ScaleAnimationTransition()));

Navigator.of(context).push(PageAnimationTransition(page: const PageTwo(), pageAnimationType: RotationAnimationTransition()));

Navigator.of(context).push(PageAnimationTransition(page: const PageTwo(), pageAnimationType: TopToBottomFadedTransition()));

Navigator.of(context).push(PageAnimationTransition(page: const PageTwo(), pageAnimationType: BottomToTopFadedTransition()));

Navigator.of(context).push(PageAnimationTransition(page: const PageTwo(), pageAnimationType: RightToLeftFadedTransition()));

Navigator.of(context).push(PageAnimationTransition(page: const PageTwo(), pageAnimationType: LeftToRightFadedTransition()));

Navigator.of(context).push(PageAnimationTransition(page: const PageTwo(), pageAnimationType: ScaleFadedTransition()));

Navigator.of(context).push(PageAnimationTransition(page: const PageTwo(), pageAnimationType: RotationFadedTransition()));

Navigator.of(context).push(PageAnimationTransition(page: const PageTwo(), pageAnimationType: SizeAnimationTransition()));

Navigator.of(context).push(PageAnimationTransition(page: const PageTwo(), pageAnimationType: TopLeftToBottomRightTransition()));

Navigator.of(context).push(PageAnimationTransition(page: const PageTwo(), pageAnimationType: BottomRightToTopLeftTransition()));

Navigator.of(context).push(PageAnimationTransition(page: const PageTwo(), pageAnimationType: TopRightToBottomLeftTransition()));

Navigator.of(context).push(PageAnimationTransition(page: const PageTwo(), pageAnimationType: BottomLeftToTopRightTransition()));
```

## Customizing duration and curves

`PageAnimationTransition` accepts optional `duration`, `reverseDuration`,
`curve`, and `reverseCurve` parameters so you're not limited to the default
timing:

```dart
Navigator.of(context).push(PageAnimationTransition(
  page: const PageTwo(),
  pageAnimationType: FadeAnimationTransition(),
  duration: const Duration(milliseconds: 800),
  reverseDuration: const Duration(milliseconds: 400),
  curve: Curves.easeInOutBack,
  reverseCurve: Curves.easeIn,
));
```

| Parameter         | Description                                             | Default            |
|-------------------|----------------------------------------------------------|---------------------|
| `duration`        | How long the forward (push) transition takes             | `300ms`             |
| `reverseDuration` | How long the reverse (pop) transition takes               | same as `duration`  |
| `curve`           | Easing curve applied to the forward transition             | `Curves.linear`      |
| `reverseCurve`    | Easing curve applied when popping the route                | same as `curve`      |

## Using with named routes

Define the `onGenerateRoute` property on your `MaterialApp` and return a
`PageAnimationTransition` for each named route:

```dart
onGenerateRoute: (settings) {
  switch (settings.name) {
    case '/pageTwo':
      return PageAnimationTransition(
        page: const PageTwo(),
        pageAnimationType: LeftToRightFadedTransition(),
      );
    default:
      return null;
  }
},
```

Then navigate as usual:

```dart
Navigator.pushNamed(context, '/pageTwo');
```

## Example app

A complete, runnable example with a button for every transition (including a
custom duration/curve demo) lives in the [`example/`](example) directory. Clone
this repository and run:

```
cd example
flutter run
```

## FAQ

**How do I add a page transition animation in Flutter?**
Wrap the page you're navigating to in a `PageAnimationTransition` and pass it
to `Navigator.push` (or return it from `onGenerateRoute`) instead of using
`MaterialPageRoute` — see [Quick start](#quick-start).

**Can I control how fast the transition animates?**
Yes — pass `duration` (and optionally `reverseDuration`) to
`PageAnimationTransition`. See [Customizing duration and curves](#customizing-duration-and-curves).

**Can I use an easing curve like `Curves.easeInOut` or a bounce effect?**
Yes — pass `curve` and, if you want a different easing on pop, `reverseCurve`.

**Can I write my own custom transition?**
Yes — implement `PageAnimationInterface`'s single `animate` method and pass an
instance of your class as `pageAnimationType`.

**Does this replace `Navigator` or `go_router`?**
No — `PageAnimationTransition` is a `PageRouteBuilder`, so it plugs directly
into Flutter's standard imperative `Navigator` API and `onGenerateRoute`. It
doesn't change how you manage routes, only how they animate.

## Contributing

Issues and pull requests are welcome on
[GitHub](https://github.com/aayushkedawat/page_animation_transition). If
you'd like to add a new transition, implement `PageAnimationInterface` in
`lib/animations/` following the existing examples and add a widget test in
`test/`.

## License

[MIT](LICENSE)
