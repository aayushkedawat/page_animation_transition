import 'package:flutter/material.dart';
import 'package:page_animation_transition/page_animation_interface.dart';

class LeftToRightTransition implements PageAnimationInterface {
  @override
  Widget animate(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return SlideTransition(
      position: Tween<Offset>(begin: const Offset(-1, 0), end: Offset.zero)
          .animate(animation),
      child: child,
    );
  }
}
