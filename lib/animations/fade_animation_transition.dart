import 'package:flutter/material.dart';
import 'package:page_animation_transition/page_animation_interface.dart';

/// Cross-fades the new page in via an opacity animation.
class FadeAnimationTransition implements PageAnimationInterface {
  /// Builds the fade transition.
  @override
  Widget animate(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(
      opacity: Tween<double>(begin: 0, end: 1).animate(animation),
      child: child,
    );
  }
}
