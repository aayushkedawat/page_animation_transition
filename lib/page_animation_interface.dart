import 'package:flutter/material.dart';

abstract class PageAnimationInterface {
  Widget animate(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child);
}
