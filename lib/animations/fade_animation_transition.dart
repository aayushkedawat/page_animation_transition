import 'package:flutter/material.dart';
import 'package:page_animation_transition/page_animation_interface.dart';

class FadeAnimationTransition implements PageAnimationInterface {
  @override
  Widget animate(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(
      opacity: Tween<double>(begin: 0, end: 1).animate(animation),
      child: child,
    );
  }
}
