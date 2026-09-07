import 'package:flutter/material.dart';
import 'package:page_animation_transition/page_animation_interface.dart';

/// Slides the new page up from the bottom of the screen while fading it in.
class BottomToTopFadedTransition implements PageAnimationInterface {
  /// Builds the slide-up-and-fade transition.
  @override
  Widget animate(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return SlideTransition(
      position: Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
          .animate(animation),
      child: FadeTransition(
        opacity: Tween<double>(begin: 0, end: 1).animate(animation),
        child: child,
      ),
    );
  }
}
