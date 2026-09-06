import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_animation_transition/page_animation_transition.dart';

/// A standalone example showing PageAnimationTransitionPage used as a
/// go_router `pageBuilder`. Run it with:
///
///   flutter run -t lib/go_router_main.dart
void main() {
  runApp(GoRouterExampleApp());
}

class GoRouterExampleApp extends StatelessWidget {
  GoRouterExampleApp({super.key});

  final GoRouter _router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            title: const Text('go_router + page_animation_transition'),
          ),
          body: Center(
            child: ElevatedButton(
              onPressed: () => context.go('/two'),
              child: const Text('Go to page two'),
            ),
          ),
        ),
      ),
      GoRoute(
        path: '/two',
        pageBuilder: (context, state) => PageAnimationTransitionPage(
          key: state.pageKey,
          pageAnimationType: LeftToRightFadedTransition(),
          duration: const Duration(milliseconds: 400),
          child: Scaffold(
            appBar: AppBar(title: const Text('Page Two')),
            body: Center(
              child: ElevatedButton(
                onPressed: () => context.pop(),
                child: const Text('Back'),
              ),
            ),
          ),
        ),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: _router);
  }
}
