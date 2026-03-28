import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:page_animation_transition/page_animation_interface.dart';

class FlipTransition implements PageAnimationInterface {
  @override
  Widget animate(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return AnimatedBuilder(
      animation: animation,
      child: child,
      builder: (context, child) {
        final angle = (1.0 - animation.value) * math.pi / 2;
        return Transform(
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateY(angle),
          alignment: Alignment.center,
          child: child,
        );
      },
    );
  }
}
