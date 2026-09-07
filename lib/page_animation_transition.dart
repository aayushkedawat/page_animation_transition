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

/// A [PageRouteBuilder] that animates [page] in and out using
/// [pageAnimationType], for use with the imperative `Navigator` API
/// (`Navigator.push`, `onGenerateRoute`).
///
/// For Navigator 2.0 / declarative routers (go_router and similar), use
/// [PageAnimationTransitionPage] instead.
class PageAnimationTransition extends PageRouteBuilder {
  /// The page to display once the transition completes.
  final Widget page;

  /// The transition strategy used to animate [page] in and out.
  final PageAnimationInterface pageAnimationType;

  /// The easing curve applied to the forward (push) transition.
  ///
  /// Defaults to [Curves.linear].
  final Curve curve;

  /// The easing curve applied when popping the route.
  ///
  /// Defaults to [curve] if not set.
  final Curve? reverseCurve;

  /// Creates a route that shows [page] using the [pageAnimationType]
  /// transition.
  ///
  /// [duration] and [reverseDuration] control how long the forward and
  /// reverse transitions take; [reverseDuration] defaults to [duration].
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

  /// Builds the transition by delegating to [pageAnimationType], after
  /// applying [curve]/[reverseCurve] to the incoming animations.
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
