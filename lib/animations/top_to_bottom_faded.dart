import 'package:flutter/material.dart';
import 'package:page_animation_transition/page_animation_interface.dart';

/// Slides the new page down from the top of the screen while fading it in.
class TopToBottomFadedTransition implements PageAnimationInterface {
  /// Builds the slide-down-and-fade transition.
  @override
  Widget animate(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return SlideTransition(
      position: Tween<Offset>(begin: const Offset(0, -1), end: Offset.zero)
          .animate(animation),
      child: FadeTransition(
        opacity: Tween<double>(begin: 0, end: 1).animate(animation),
        child: child,
      ),
    );
  }
}
