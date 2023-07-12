import 'package:flutter/material.dart';
import 'package:page_animation_transition/page_animation_interface.dart';

/// Top to Bottom Faded transition
class TopToBottomFadedTransition implements PageAnimationInterface {
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
