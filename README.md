
Using this package, you can add beautiful page transitions to your application.

### Usage
It is really easy to use! You should ensure that you add the
page_animation_transition as a dependency in your flutter project

```
dependencies:
  page_animation_transition: ^latest_version

```

A single import gives you `PageAnimationTransition` and every transition type:

```
import 'package:page_animation_transition/page_animation_transition.dart';
```

Below are some examples:
```
Navigator.of(context).push(PageAnimationTransition(page: const PageTwo(), pageAnimationType: BottomToTopTransition()));

Navigator.of(context).push(PageAnimationTransition(page: const PageTwo(), pageAnimationType: TopToBottomTransition()));

Navigator.of(context).push(PageAnimationTransition(page: const PageTwo(), pageAnimationType: RightToLeftTransition()));

Navigator.of(context).push(PageAnimationTransition(page: const PageTwo(), pageAnimationType: LeftToRightTransition()));

Navigator.of(context).push(PageAnimationTransition(page: const PageTwo(), pageAnimationType: FadeAnimationTransition()));

Navigator.of(context).push(PageAnimationTransition(page: const PageTwo(), pageAnimationType: ScaleAnimationTransition()));

Navigator.of(context).push(PageAnimationTransition(page: const PageTwo(), pageAnimationType: RotationAnimationTransition()));

Navigator.of(context).push(PageAnimationTransition(page: const PageTwo(), pageAnimationType: TopToBottomFadedTransition()));

Navigator.of(context).push(PageAnimationTransition(page: const PageTwo(), pageAnimationType: BottomToTopFadedTransition()));

Navigator.of(context).push(PageAnimationTransition(page: const PageTwo(), pageAnimationType: RightToLeftFadedTransition()));

Navigator.of(context).push(PageAnimationTransition(page: const PageTwo(), pageAnimationType: LeftToRightFadedTransition()));

Navigator.of(context).push(PageAnimationTransition(page: const PageTwo(), pageAnimationType: ScaleFadedTransition()));

Navigator.of(context).push(PageAnimationTransition(page: const PageTwo(), pageAnimationType: RotationFadedTransition()));

Navigator.of(context).push(PageAnimationTransition(page: const PageTwo(), pageAnimationType: SizeAnimationTransition()));

Navigator.of(context).push(PageAnimationTransition(page: const PageTwo(), pageAnimationType: TopLeftToBottomRightTransition()));

Navigator.of(context).push(PageAnimationTransition(page: const PageTwo(), pageAnimationType: BottomRightToTopLeftTransition()));

Navigator.of(context).push(PageAnimationTransition(page: const PageTwo(), pageAnimationType: TopRightToBottomLeftTransition()));

Navigator.of(context).push(PageAnimationTransition(page: const PageTwo(), pageAnimationType: BottomLeftToTopRightTransition()));
```

### Customizing duration and curve

`PageAnimationTransition` accepts optional `duration`, `reverseDuration`, `curve` and
`reverseCurve` parameters so you are not limited to the default timing:

```
Navigator.of(context).push(PageAnimationTransition(
  page: const PageTwo(),
  pageAnimationType: FadeAnimationTransition(),
  duration: const Duration(milliseconds: 800),
  reverseDuration: const Duration(milliseconds: 400),
  curve: Curves.easeInOutBack,
  reverseCurve: Curves.easeIn,
));
```

* `duration` — how long the forward (push) transition takes. Defaults to 300ms.
* `reverseDuration` — how long the reverse (pop) transition takes. Defaults to `duration`.
* `curve` — the easing curve applied to the transition. Defaults to `Curves.linear`.
* `reverseCurve` — the easing curve used when popping the route. Defaults to `curve`.

### Usage for predefined routes

First, define the ```onGenerateRoute``` property in the 
MaterialApp widget like below and in switch cases you can transition to your new routes:

```
onGenerateRoute: (settings) {
    switch (settings.name) {
      case '/pageTwo':
        return PageAnimationTransition(child: PageTwo(), pageAnimationType: LeftToRightFadedTransition());
        break;
      default:
        return null;
    }
  }
  ```

  After this, the new route can be used like:

  ```Navigator.pushNamed(context, '/pageTwo');```


### Types of transitions

bottomToTop

topToBottom

leftToRight

rightToLeft

fadeAnimation

scaleAnimation

rotateAnimation

topToBottomFaded

bottomToTopFaded

leftToRightFaded

rightToLeftFaded

scaleFaded

rotateFaded

size

topLeftToBottomRight

bottomRightToTopLeft

topRightToBottomLeft

bottomLeftToTopRight
