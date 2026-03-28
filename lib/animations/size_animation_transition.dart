import 'package:flutter/material.dart';
import 'package:page_animation_transition/page_animation_interface.dart';

class SizeAnimationTransition implements PageAnimationInterface {
  @override
  Widget animate(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return Align(
      child: SizeTransition(
        sizeFactor: animation,
        child: child,
      ),
    );
  }
}
