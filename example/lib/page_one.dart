import 'package:page_animation_transition/animations/bottom_to_top_faded_transition.dart';
import 'package:page_animation_transition/animations/bottom_to_top_transition.dart';
import 'package:page_animation_transition/animations/fade_animation_transition.dart';
import 'package:page_animation_transition/animations/left_to_right_faded_transition.dart';
import 'package:page_animation_transition/animations/left_to_right_transition.dart';
import 'package:page_animation_transition/animations/right_to_left_faded_transition.dart';
import 'package:page_animation_transition/animations/right_to_left_transition.dart';
import 'package:page_animation_transition/animations/rotate_animation_transition.dart';
import 'package:page_animation_transition/animations/scale_animation_transition.dart';
import 'package:page_animation_transition/animations/top_to_bottom_faded.dart';
import 'package:page_animation_transition/animations/top_to_bottom_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';
import 'page_two.dart';
import 'package:flutter/material.dart';

class PageOne extends StatelessWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page Animation Transition'),
        centerTitle: true,
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(PageAnimationTransition(
                      page: const PageTwo(),
                      pageAnimationType: BottomToTopTransition()));
                },
                child: const Text('Bottom To Top')),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(PageAnimationTransition(
                      page: const PageTwo(),
                      pageAnimationType: TopToBottomTransition()));
                },
                child: const Text('Top to bottom')),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(PageAnimationTransition(
                      page: const PageTwo(),
                      pageAnimationType: RightToLeftTransition()));
                },
                child: const Text('Right To Left')),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(PageAnimationTransition(
                      page: const PageTwo(),
                      pageAnimationType: LeftToRightTransition()));
                },
                child: const Text('Left to Right')),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(PageAnimationTransition(
                      page: const PageTwo(),
                      pageAnimationType: FadeAnimationTransition()));
                },
                child: const Text('Faded')),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(PageAnimationTransition(
                      page: const PageTwo(),
                      pageAnimationType: ScaleAnimationTransition()));
                },
                child: const Text('Scale')),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(PageAnimationTransition(
                      page: const PageTwo(),
                      pageAnimationType: RotationAnimationTransition()));
                },
                child: const Text('Rotate')),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(PageAnimationTransition(
                      page: const PageTwo(),
                      pageAnimationType: TopToBottomFadedTransition()));
                },
                child: const Text('Top to Bottom Faded')),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(PageAnimationTransition(
                      page: const PageTwo(),
                      pageAnimationType: BottomToTopFadedTransition()));
                },
                child: const Text('Bottom to Top Faded')),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(PageAnimationTransition(
                      page: const PageTwo(),
                      pageAnimationType: RightToLeftFadedTransition()));
                },
                child: const Text('Right to Left Faded')),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(PageAnimationTransition(
                      page: const PageTwo(),
                      pageAnimationType: LeftToRightFadedTransition()));
                },
                child: const Text('Left to Right Faded')),
          ],
        ),
      ),
    );
  }
}
