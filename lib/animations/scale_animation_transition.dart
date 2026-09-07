import 'package:flutter/material.dart';
import 'package:page_animation_transition/page_animation_interface.dart';

/// Zooms the new page in from a point.
class ScaleAnimationTransition implements PageAnimationInterface {
  /// Builds the scale transition.
  @override
  Widget animate(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return ScaleTransition(
      scale: Tween<double>(begin: 0, end: 1).animate(animation),
      child: child,
    );
  }
}
