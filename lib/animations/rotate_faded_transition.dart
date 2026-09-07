import 'package:flutter/material.dart';
import 'package:page_animation_transition/page_animation_interface.dart';

/// Rotates the new page into view while fading it in.
class RotationFadedTransition implements PageAnimationInterface {
  /// Builds the rotate-and-fade transition.
  @override
  Widget animate(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return RotationTransition(
      turns: Tween<double>(begin: 0, end: 1).animate(animation),
      child: FadeTransition(
        opacity: Tween<double>(begin: 0, end: 1).animate(animation),
        child: child,
      ),
    );
  }
}
