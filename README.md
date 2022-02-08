
Using this package, you can add beautiful page transitions to your application.

### Usage
It is really easy to use! You should ensure that you add the
page_animation_transition as a dependency in your flutter project

```
dependencies:
  page_animation_transition: ^latest_version

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
```

### Usage for predefined routes

First, define the ```onGenerateRoute``` property in the 
MaterialApp widget like below and in switch cases you can transition to your new routes:

```
onGenerateRoute: (settings) {
    switch (settings.name) {
      case '/pageTwo':
        return PageTransition(child: PageTwo(), pageAnimationType: LeftToRightFadedTransition());
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