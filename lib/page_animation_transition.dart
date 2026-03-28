library page_animation_transition;

import 'package:flutter/material.dart';
import 'package:page_animation_transition/page_animation_interface.dart';

class PageAnimationTransition extends PageRouteBuilder {
  final Widget page;
  final PageAnimationInterface pageAnimationType;
  final Curve curve;

  PageAnimationTransition({
    required this.page,
    required this.pageAnimationType,
    this.curve = Curves.linear,
    Duration duration = const Duration(milliseconds: 300),
  }) : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionDuration: duration,
        );

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return pageAnimationType.animate(
      context,
      CurvedAnimation(parent: animation, curve: curve),
      secondaryAnimation,
      child,
    );
  }
}
