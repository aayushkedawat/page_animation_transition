import 'package:flutter/material.dart';
import 'package:page_animation_transition/page_animation_interface.dart';

/// Slides the new page in diagonally from the top-right corner.
class TopRightToBottomLeftTransition implements PageAnimationInterface {
  /// Builds the diagonal slide transition.
  @override
  Widget animate(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return SlideTransition(
      position: Tween<Offset>(begin: const Offset(1, -1), end: Offset.zero)
          .animate(animation),
      child: child,
    );
  }
}
