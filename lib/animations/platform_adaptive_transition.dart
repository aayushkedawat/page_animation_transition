import 'package:flutter/material.dart';
import 'package:page_animation_transition/page_animation_interface.dart';

/// Automatically picks a transition that matches the host platform's
/// native navigation style:
///
/// - iOS / macOS → right-to-left slide (Cupertino push)
/// - Android / Fuchsia / Linux / Windows / web → bottom-to-top slide with
///   fade (Material You)
class PlatformAdaptiveTransition implements PageAnimationInterface {
  @override
  Widget animate(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    final platform = Theme.of(context).platform;
    final bool isApple =
        platform == TargetPlatform.iOS || platform == TargetPlatform.macOS;

    if (isApple) {
      return SlideTransition(
        position: Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero)
            .animate(animation),
        child: child,
      );
    }

    return SlideTransition(
      position: Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
          .animate(animation),
      child: FadeTransition(
        opacity: Tween<double>(begin: 0, end: 1).animate(animation),
        child: child,
      ),
    );
  }
}
