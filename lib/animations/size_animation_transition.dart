import 'package:flutter/material.dart';
import 'package:page_animation_transition/page_animation_interface.dart';

// Uses SizeTransition's `axisAlignment` (deprecated in favor of `alignment`
// on Flutter >=3.41) since `alignment` isn't available on the Flutter
// >=3.0.0 versions this package still supports.
class SizeAnimationTransition implements PageAnimationInterface {
  final Axis axis;
  final double axisAlignment;

  SizeAnimationTransition({this.axis = Axis.vertical, this.axisAlignment = 0});

  @override
  Widget animate(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return Align(
      child: SizeTransition(
        sizeFactor: Tween<double>(begin: 0, end: 1).animate(animation),
        axis: axis,
        // ignore: deprecated_member_use
        axisAlignment: axisAlignment,
        child: child,
      ),
    );
  }
}
