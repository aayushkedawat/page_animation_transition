import 'package:page_animation_transition/page_animation_transition.dart';
import 'page_two.dart';
import 'package:flutter/material.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page Animation Transition'),
        centerTitle: true,
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
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
                        pageAnimationType: ScaleFadedTransition()));
                  },
                  child: const Text('Scale Faded')),
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
                        pageAnimationType: RotationFadedTransition()));
                  },
                  child: const Text('Rotate Faded')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(PageAnimationTransition(
                        page: const PageTwo(),
                        pageAnimationType: SizeAnimationTransition()));
                  },
                  child: const Text('Size')),
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
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(PageAnimationTransition(
                        page: const PageTwo(),
                        pageAnimationType: TopLeftToBottomRightTransition()));
                  },
                  child: const Text('Top Left to Bottom Right')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(PageAnimationTransition(
                        page: const PageTwo(),
                        pageAnimationType: BottomRightToTopLeftTransition()));
                  },
                  child: const Text('Bottom Right to Top Left')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(PageAnimationTransition(
                        page: const PageTwo(),
                        pageAnimationType: TopRightToBottomLeftTransition()));
                  },
                  child: const Text('Top Right to Bottom Left')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(PageAnimationTransition(
                        page: const PageTwo(),
                        pageAnimationType: BottomLeftToTopRightTransition()));
                  },
                  child: const Text('Bottom Left to Top Right')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(PageAnimationTransition(
                        page: const PageTwo(),
                        pageAnimationType: FadeAnimationTransition(),
                        duration: const Duration(milliseconds: 800),
                        curve: Curves.easeInOutBack));
                  },
                  child: const Text('Custom duration & curve')),
            ],
          ),
        ),
      ),
    );
  }
}
