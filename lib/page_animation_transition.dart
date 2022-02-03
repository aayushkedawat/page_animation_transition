library page_animation_transition;

import 'package:flutter/material.dart';

import 'const.dart';

class PageAnimationTransition extends PageRouteBuilder {
  final Widget page;
  final PageAnimationType pageAnimationType;
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
    if (pageAnimationType == PageAnimationType.bottomToTop) {
      return SlideTransition(
        position: Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
            .animate(animation),
        child: child,
      );
    } else if (pageAnimationType == PageAnimationType.topToBottom) {
      return SlideTransition(
        position: Tween<Offset>(begin: const Offset(0, -1), end: Offset.zero)
            .animate(animation),
        child: child,
      );
    } else if (pageAnimationType == PageAnimationType.leftToRight) {
      return SlideTransition(
        position: Tween<Offset>(begin: const Offset(-1, 0), end: Offset.zero)
            .animate(animation),
        child: child,
      );
    } else if (pageAnimationType == PageAnimationType.rightToLeft) {
      return SlideTransition(
        position: Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero)
            .animate(animation),
        child: child,
      );
    } else if (pageAnimationType == PageAnimationType.fadeAnimation) {
      return FadeTransition(
        opacity: Tween<double>(begin: 0, end: 1).animate(animation),
        child: child,
      );
    } else if (pageAnimationType == PageAnimationType.scaleAnimation) {
      return ScaleTransition(
        scale: Tween<double>(begin: 0, end: 1).animate(animation),
        child: child,
      );
    } else if (pageAnimationType == PageAnimationType.rotateAnimation) {
      return RotationTransition(
        turns: Tween<double>(begin: 0, end: 1).animate(animation),
        child: child,
      );
    } else if (pageAnimationType == PageAnimationType.bottomToTopFaded) {
      return SlideTransition(
        position: Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
            .animate(animation),
        child: FadeTransition(
          opacity: Tween<double>(begin: 0, end: 1).animate(animation),
          child: child,
        ),
      );
    } else if (pageAnimationType == PageAnimationType.topToBottomFaded) {
      return SlideTransition(
        position: Tween<Offset>(begin: const Offset(0, -1), end: Offset.zero)
            .animate(animation),
        child: FadeTransition(
          opacity: Tween<double>(begin: 0, end: 1).animate(animation),
          child: child,
        ),
      );
    } else if (pageAnimationType == PageAnimationType.leftToRightFaded) {
      return SlideTransition(
        position: Tween<Offset>(begin: const Offset(-1, 0), end: Offset.zero)
            .animate(animation),
        child: FadeTransition(
          opacity: Tween<double>(begin: 0, end: 1).animate(animation),
          child: child,
        ),
      );
    } else if (pageAnimationType == PageAnimationType.rightToLeftFaded) {
      return SlideTransition(
        position: Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero)
            .animate(animation),
        child: FadeTransition(
          opacity: Tween<double>(begin: 0, end: 1).animate(animation),
          child: child,
        ),
      );
    }
    return child;
  }
}
