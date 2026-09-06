import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:page_animation_transition/page_animation_transition.dart';

void main() {
  final allAnimationTypes = <String, PageAnimationInterface Function()>{
    'BottomToTopTransition': () => BottomToTopTransition(),
    'BottomToTopFadedTransition': () => BottomToTopFadedTransition(),
    'TopToBottomTransition': () => TopToBottomTransition(),
    'TopToBottomFadedTransition': () => TopToBottomFadedTransition(),
    'LeftToRightTransition': () => LeftToRightTransition(),
    'LeftToRightFadedTransition': () => LeftToRightFadedTransition(),
    'RightToLeftTransition': () => RightToLeftTransition(),
    'RightToLeftFadedTransition': () => RightToLeftFadedTransition(),
    'FadeAnimationTransition': () => FadeAnimationTransition(),
    'ScaleAnimationTransition': () => ScaleAnimationTransition(),
    'ScaleFadedTransition': () => ScaleFadedTransition(),
    'RotationAnimationTransition': () => RotationAnimationTransition(),
    'RotationFadedTransition': () => RotationFadedTransition(),
    'SizeAnimationTransition': () => SizeAnimationTransition(),
    'TopLeftToBottomRightTransition': () => TopLeftToBottomRightTransition(),
    'TopRightToBottomLeftTransition': () => TopRightToBottomLeftTransition(),
    'BottomLeftToTopRightTransition': () => BottomLeftToTopRightTransition(),
    'BottomRightToTopLeftTransition': () => BottomRightToTopLeftTransition(),
  };

  Widget buildHarness(PageAnimationInterface animationType,
      {Duration? duration, Curve? curve, Curve? reverseCurve}) {
    return MaterialApp(
      home: Builder(
        builder: (context) => ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(PageAnimationTransition(
              page: const Scaffold(body: Text('Second Page')),
              pageAnimationType: animationType,
              duration: duration ?? const Duration(milliseconds: 300),
              curve: curve ?? Curves.linear,
              reverseCurve: reverseCurve,
            ));
          },
          child: const Text('Go'),
        ),
      ),
    );
  }

  for (final entry in allAnimationTypes.entries) {
    testWidgets('${entry.key} navigates to the new page',
        (WidgetTester tester) async {
      await tester.pumpWidget(buildHarness(entry.value()));

      expect(find.text('Second Page'), findsNothing);

      await tester.tap(find.text('Go'));
      await tester.pumpAndSettle();

      expect(find.text('Second Page'), findsOneWidget);
    });
  }

  testWidgets('supports a custom duration and curve',
      (WidgetTester tester) async {
    await tester.pumpWidget(buildHarness(
      FadeAnimationTransition(),
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
      reverseCurve: Curves.easeIn,
    ));

    await tester.tap(find.text('Go'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 300));

    // Halfway through a 600ms transition, the new page is already in the
    // tree (mid-fade) while the pop animation hasn't finished settling.
    expect(find.text('Second Page'), findsOneWidget);

    await tester.pumpAndSettle();
    expect(find.text('Second Page'), findsOneWidget);
  });

  testWidgets('pops back to the first page', (WidgetTester tester) async {
    await tester.pumpWidget(buildHarness(LeftToRightTransition()));

    await tester.tap(find.text('Go'));
    await tester.pumpAndSettle();
    expect(find.text('Second Page'), findsOneWidget);

    final BuildContext secondPageContext =
        tester.element(find.text('Second Page'));
    Navigator.of(secondPageContext).pop();
    await tester.pumpAndSettle();

    expect(find.text('Go'), findsOneWidget);
    expect(find.text('Second Page'), findsNothing);
  });
}
