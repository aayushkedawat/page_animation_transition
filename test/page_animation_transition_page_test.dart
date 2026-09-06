import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:page_animation_transition/page_animation_transition.dart';

void main() {
  testWidgets('PageAnimationTransitionPage navigates via Navigator.push',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Builder(
        builder: (context) => ElevatedButton(
          onPressed: () {
            final page = PageAnimationTransitionPage(
              child: const Scaffold(body: Text('Second Page')),
              pageAnimationType: FadeAnimationTransition(),
            );
            Navigator.of(context).push(page.createRoute(context));
          },
          child: const Text('Go'),
        ),
      ),
    ));

    expect(find.text('Second Page'), findsNothing);

    await tester.tap(find.text('Go'));
    await tester.pumpAndSettle();

    expect(find.text('Second Page'), findsOneWidget);
  });

  testWidgets('PageAnimationTransitionPage works as a go_router pageBuilder',
      (WidgetTester tester) async {
    final router = GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => Scaffold(
            body: Center(
              child: ElevatedButton(
                onPressed: () => context.go('/two'),
                child: const Text('Go'),
              ),
            ),
          ),
        ),
        GoRoute(
          path: '/two',
          pageBuilder: (context, state) => PageAnimationTransitionPage(
            key: state.pageKey,
            child: const Scaffold(body: Text('Second Page')),
            pageAnimationType: LeftToRightTransition(),
          ),
        ),
      ],
    );
    addTearDown(router.dispose);

    await tester.pumpWidget(MaterialApp.router(routerConfig: router));

    expect(find.text('Second Page'), findsNothing);

    await tester.tap(find.text('Go'));
    await tester.pumpAndSettle();

    expect(find.text('Second Page'), findsOneWidget);
  });

  testWidgets('PageAnimationTransitionPage respects custom duration and curve',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Builder(
        builder: (context) => ElevatedButton(
          onPressed: () {
            final page = PageAnimationTransitionPage(
              child: const Scaffold(body: Text('Second Page')),
              pageAnimationType: ScaleAnimationTransition(),
              duration: const Duration(milliseconds: 600),
              curve: Curves.easeInOut,
            );
            Navigator.of(context).push(page.createRoute(context));
          },
          child: const Text('Go'),
        ),
      ),
    ));

    await tester.tap(find.text('Go'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 300));

    expect(find.text('Second Page'), findsOneWidget);

    await tester.pumpAndSettle();
    expect(find.text('Second Page'), findsOneWidget);
  });
}
