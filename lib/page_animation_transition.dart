library page_animation_transition;

import 'package:flutter/material.dart';
import 'package:page_animation_transition/page_animation_interface.dart';

export 'package:page_animation_transition/page_animation_interface.dart';
export 'package:page_animation_transition/page_animation_transition_page.dart';
export 'package:page_animation_transition/animations/bottom_left_to_top_right_transition.dart';
export 'package:page_animation_transition/animations/bottom_right_to_top_left_transition.dart';
export 'package:page_animation_transition/animations/bottom_to_top_faded_transition.dart';
export 'package:page_animation_transition/animations/bottom_to_top_transition.dart';
export 'package:page_animation_transition/animations/fade_animation_transition.dart';
export 'package:page_animation_transition/animations/left_to_right_faded_transition.dart';
export 'package:page_animation_transition/animations/left_to_right_transition.dart';
export 'package:page_animation_transition/animations/right_to_left_faded_transition.dart';
export 'package:page_animation_transition/animations/right_to_left_transition.dart';
export 'package:page_animation_transition/animations/rotate_animation_transition.dart';
export 'package:page_animation_transition/animations/rotate_faded_transition.dart';
export 'package:page_animation_transition/animations/scale_animation_transition.dart';
export 'package:page_animation_transition/animations/scale_faded_transition.dart';
export 'package:page_animation_transition/animations/size_animation_transition.dart';
export 'package:page_animation_transition/animations/top_left_to_bottom_right_transition.dart';
export 'package:page_animation_transition/animations/top_right_to_bottom_left_transition.dart';
export 'package:page_animation_transition/animations/top_to_bottom_faded.dart';
export 'package:page_animation_transition/animations/top_to_bottom_transition.dart';

class PageAnimationTransition extends PageRouteBuilder {
  final Widget page;
  final PageAnimationInterface pageAnimationType;
  final Curve curve;
  final Curve? reverseCurve;

  PageAnimationTransition({
    required this.page,
    required this.pageAnimationType,
    Duration duration = const Duration(milliseconds: 300),
    Duration? reverseDuration,
    this.curve = Curves.linear,
    this.reverseCurve,
    super.settings,
  }) : super(
          transitionDuration: duration,
          reverseTransitionDuration: reverseDuration ?? duration,
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
        );

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    final curvedAnimation = CurvedAnimation(
      parent: animation,
      curve: curve,
      reverseCurve: reverseCurve ?? curve,
    );
    final curvedSecondaryAnimation = CurvedAnimation(
      parent: secondaryAnimation,
      curve: curve,
      reverseCurve: reverseCurve ?? curve,
    );
    return pageAnimationType.animate(
        context, curvedAnimation, curvedSecondaryAnimation, child);
  }
}
