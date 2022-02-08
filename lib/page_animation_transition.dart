library page_animation_transition;

import 'package:flutter/material.dart';
import 'package:page_animation_transition/page_animation_interface.dart';

class PageAnimationTransition extends PageRouteBuilder {
  final Widget page;
  final PageAnimationInterface pageAnimationType;
  PageAnimationTransition({required this.page, required this.pageAnimationType})
      : super(
            pageBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
        ) =>
                page);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return pageAnimationType.animate(
        context, animation, secondaryAnimation, child);
  }
}
