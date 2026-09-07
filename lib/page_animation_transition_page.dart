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
  /// The content to show in the route created by this page.
  final Widget child;

  /// The transition strategy used to animate [child] in and out.
  final PageAnimationInterface pageAnimationType;

  /// How long the forward (push) transition takes. Defaults to 300ms.
  final Duration duration;

  /// How long the reverse (pop) transition takes. Defaults to [duration].
  final Duration reverseDuration;

  /// The easing curve applied to the forward transition.
  ///
  /// Defaults to [Curves.linear].
  final Curve curve;

  /// The easing curve applied when popping the route.
  ///
  /// Defaults to [curve] if not set.
  final Curve? reverseCurve;

  /// Whether the route should remain in memory when it is inactive. See
  /// [ModalRoute.maintainState].
  final bool maintainState;

  /// Whether this page route is a full-screen dialog. See
  /// [PageRoute.fullscreenDialog].
  final bool fullscreenDialog;

  /// Whether the route obscures previous routes when its entrance
  /// transition is complete. See [ModalRoute.opaque].
  final bool opaque;

  /// Whether you can dismiss this route by tapping the modal barrier. See
  /// [ModalRoute.barrierDismissible].
  final bool barrierDismissible;

  /// The color of the modal barrier, or `null` for a transparent barrier.
  final Color? barrierColor;

  /// The semantic label read out for a dismissible barrier.
  final String? barrierLabel;

  /// Creates a [Page] that shows [child] using the [pageAnimationType]
  /// transition, for use with Navigator 2.0 / declarative routers such as
  /// go_router.
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

  /// Creates the [Route] that renders [child] with the configured
  /// transition.
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
