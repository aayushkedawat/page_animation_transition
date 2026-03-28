
Using this package, you can add beautiful page transitions to your application.

### Installation

Add the dependency to your `pubspec.yaml`:

```yaml
dependencies:
  page_animation_transition: ^0.1.0
```

### Basic Usage

```dart
Navigator.of(context).push(PageAnimationTransition(
  page: const PageTwo(),
  pageAnimationType: BottomToTopTransition(),
));
```

### Custom Duration & Curve

Control animation speed and easing without subclassing:

```dart
Navigator.of(context).push(PageAnimationTransition(
  page: const PageTwo(),
  pageAnimationType: BottomToTopTransition(),
  duration: const Duration(milliseconds: 500),
  curve: Curves.easeInOut,
));
```

### All Transition Examples

```dart
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

Navigator.of(context).push(PageAnimationTransition(page: const PageTwo(), pageAnimationType: FlipTransition()));

Navigator.of(context).push(PageAnimationTransition(page: const PageTwo(), pageAnimationType: ScaleFadeTransition()));

Navigator.of(context).push(PageAnimationTransition(page: const PageTwo(), pageAnimationType: SizeAnimationTransition()));

Navigator.of(context).push(PageAnimationTransition(page: const PageTwo(), pageAnimationType: PlatformAdaptiveTransition()));
```

### Usage with Named Routes

```dart
onGenerateRoute: (settings) {
  switch (settings.name) {
    case '/pageTwo':
      return PageAnimationTransition(
        page: const PageTwo(),
        pageAnimationType: LeftToRightFadedTransition(),
      );
    default:
      return null;
  }
}
```

Then navigate with:

```dart
Navigator.pushNamed(context, '/pageTwo');
```

### Types of Transitions

| Class | Effect |
|---|---|
| `BottomToTopTransition` | Slide from bottom |
| `TopToBottomTransition` | Slide from top |
| `LeftToRightTransition` | Slide from left |
| `RightToLeftTransition` | Slide from right |
| `FadeAnimationTransition` | Fade in/out |
| `ScaleAnimationTransition` | Scale in/out |
| `RotationAnimationTransition` | Rotation |
| `BottomToTopFadedTransition` | Slide bottom + fade |
| `TopToBottomFadedTransition` | Slide top + fade |
| `LeftToRightFadedTransition` | Slide left + fade |
| `RightToLeftFadedTransition` | Slide right + fade |
| `FlipTransition` | 3D perspective Y-axis flip |
| `ScaleFadeTransition` | Scale + fade combined |
| `SizeAnimationTransition` | Expand/collapse (SizeTransition) |
| `PlatformAdaptiveTransition` | Matches platform native style |
