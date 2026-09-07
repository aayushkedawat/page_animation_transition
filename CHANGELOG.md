## 0.0.3

* Updated Readme

## 0.0.4

* Added repository

## 0.0.6

* Updated code

## 0.0.7

* Updated Readme

## 0.0.8

* Added example

## 0.0.9

* Updated Readme

## 1.1.0

* Added 7 new transition types: `ScaleFadedTransition`, `RotationFadedTransition`,
  `SizeAnimationTransition`, `TopLeftToBottomRightTransition`,
  `BottomRightToTopLeftTransition`, `TopRightToBottomLeftTransition`,
  `BottomLeftToTopRightTransition`
* `PageAnimationTransition` now supports customizable `duration`,
  `reverseDuration`, `curve` and `reverseCurve` parameters
* `package:page_animation_transition/page_animation_transition.dart` now
  exports every transition type and the `PageAnimationInterface`, so a
  single import is enough to use the package
* Added widget tests covering every transition type and the new
  duration/curve customization
* Raised minimum SDK constraints (Dart `>=2.17.0 <4.0.0`, Flutter `>=3.0.0`)
  and upgraded `flutter_lints` to `^3.0.2`
* Rewrote the README with a features overview, a full transition reference
  table, an FAQ, and pub.dev score badges; added `homepage`, `issue_tracker`,
  and `topics` to `pubspec.yaml` for better pub.dev discoverability
* Added `PageAnimationTransitionPage`, a `Page` implementation for
  Navigator 2.0 / declarative routers (go_router, auto_route, Beamer,
  routemaster, VRouter) so every transition type and the duration/curve
  customization now work outside of the imperative `Navigator` API too
* Added a runnable go_router example (`example/lib/go_router_main.dart`) and
  tests proving `PageAnimationTransitionPage` works with go_router and with
  `Navigator.push`

## 1.1.1

* Added dartdoc comments to every public class, field, constructor, and
  method, and enabled the `public_member_api_docs` lint to keep future
  public API documented — fixes pub.dev's dartdoc coverage score