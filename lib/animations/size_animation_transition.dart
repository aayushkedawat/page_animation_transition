import 'package:flutter/material.dart';
import 'package:page_animation_transition/page_animation_interface.dart';

/// Expands the new page into view along an axis, growing from 0 size to
/// its natural size.
///
/// Uses SizeTransition's `axisAlignment` (deprecated in favor of
/// `alignment` on Flutter >=3.41) since `alignment` isn't available on the
/// Flutter >=3.0.0 versions this package still supports.
class SizeAnimationTransition implements PageAnimationInterface {
  /// The axis along which the page grows. Defaults to [Axis.vertical].
  final Axis axis;

  /// Where, along the cross axis, the page is aligned while it grows.
  /// Defaults to `0` (centered).
  final double axisAlignment;

  /// Creates a size transition that grows along [axis], aligned by
  /// [axisAlignment].
  SizeAnimationTransition({this.axis = Axis.vertical, this.axisAlignment = 0});

  /// Builds the size transition.
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
