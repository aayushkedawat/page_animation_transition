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

## 0.1.0

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