import 'package:flutter/material.dart';
import 'package:page_animation_transition/page_animation_interface.dart';

////// Scale transition
class ScaleAnimationTransition implements PageAnimationInterface {
  @override
  Widget animate(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return ScaleTransition(
      scale: Tween<double>(begin: 0, end: 1).animate(animation),
      child: child,
    );
  }
}
