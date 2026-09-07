import 'package:flutter/material.dart';

/// Defines a page transition animation that [PageAnimationTransition] and
/// [PageAnimationTransitionPage] can use to animate a route in and out.
///
/// Implement this to build a custom transition, or use one of the built-in
/// implementations in `package:page_animation_transition/animations/`.
abstract class PageAnimationInterface {
  /// Wraps [child] with the transition widgets that define how the route
  /// arrives on and leaves the screen.
  ///
  /// [animation] drives the route's own entrance/exit, while
  /// [secondaryAnimation] drives how this route reacts to the route pushed
  /// on top of it. Both are provided by the underlying [PageRoute].
  Widget animate(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child);
}
