import 'package:flutter/material.dart';
import 'package:page_animation_transition/page_animation_interface.dart';

/// A [Page] variant of [PageAnimationTransition] for use with Navigator 2.0 /
/// declarative routing packages that build a list of [Page]s — such as
/// go_router's `GoRoute.pageBuilder`, a raw `Navigator(pages: ...)`, or any
/// other router that consumes standard [Page] objects.
///
/// Example with go_router:
/// ```dart
/// GoRoute(
///   path: '/pageTwo',
///   pageBuilder: (context, state) => PageAnimationTransitionPage(
///     key: state.pageKey,
///     child: const PageTwo(),
///     pageAnimationType: LeftToRightTransition(),
///   ),
/// )
/// ```
class PageAnimationTransitionPage<T> extends Page<T> {
  final Widget child;
  final PageAnimationInterface pageAnimationType;
  final Duration duration;
  final Duration reverseDuration;
  final Curve curve;
  final Curve? reverseCurve;
  final bool maintainState;
  final bool fullscreenDialog;
  final bool opaque;
  final bool barrierDismissible;
  final Color? barrierColor;
  final String? barrierLabel;

  const PageAnimationTransitionPage({
    required this.child,
    required this.pageAnimationType,
    this.duration = const Duration(milliseconds: 300),
    Duration? reverseDuration,
    this.curve = Curves.linear,
    this.reverseCurve,
    this.maintainState = true,
    this.fullscreenDialog = false,
    this.opaque = true,
    this.barrierDismissible = false,
    this.barrierColor,
    this.barrierLabel,
    super.key,
    super.name,
    super.arguments,
    super.restorationId,
  }) : reverseDuration = reverseDuration ?? duration;

  @override
  Route<T> createRoute(BuildContext context) =>
      _PageAnimationTransitionPageRoute<T>(this);
}

class _PageAnimationTransitionPageRoute<T> extends PageRoute<T> {
  _PageAnimationTransitionPageRoute(PageAnimationTransitionPage<T> page)
      : super(settings: page);

  PageAnimationTransitionPage<T> get _page =>
      settings as PageAnimationTransitionPage<T>;

  @override
  bool get barrierDismissible => _page.barrierDismissible;

  @override
  Color? get barrierColor => _page.barrierColor;

  @override
  String? get barrierLabel => _page.barrierLabel;

  @override
  Duration get transitionDuration => _page.duration;

  @override
  Duration get reverseTransitionDuration => _page.reverseDuration;

  @override
  bool get maintainState => _page.maintainState;

  @override
  bool get fullscreenDialog => _page.fullscreenDialog;

  @override
  bool get opaque => _page.opaque;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) =>
      Semantics(scopesRoute: true, explicitChildNodes: true, child: _page.child);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    final curvedAnimation = CurvedAnimation(
      parent: animation,
      curve: _page.curve,
      reverseCurve: _page.reverseCurve ?? _page.curve,
    );
    final curvedSecondaryAnimation = CurvedAnimation(
      parent: secondaryAnimation,
      curve: _page.curve,
      reverseCurve: _page.reverseCurve ?? _page.curve,
    );
    return _page.pageAnimationType.animate(
        context, curvedAnimation, curvedSecondaryAnimation, child);
  }
}
