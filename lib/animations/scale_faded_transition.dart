import 'package:flutter/material.dart';
import 'package:page_animation_transition/page_animation_interface.dart';

/// Zooms the new page in from a point while fading it in.
class ScaleFadedTransition implements PageAnimationInterface {
  /// Builds the scale-and-fade transition.
  @override
  Widget animate(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return ScaleTransition(
      scale: Tween<double>(begin: 0, end: 1).animate(animation),
      child: FadeTransition(
        opacity: Tween<double>(begin: 0, end: 1).animate(animation),
        child: child,
      ),
    );
  }
}
