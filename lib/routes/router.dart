import 'package:checkout/src/widgets/screens/dashboard_screen%20/dashboard_screen.dart';
import 'package:checkout/src/widgets/shared/navigation_helper_widget/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>();

GoRouter router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return AppScaffold();
      },
      routes: [
        GoRoute(
          name: CheckoutScreen.name,
          path: '/',
          builder: (context, state) => const CheckoutScreen(),
        ),
        GoRoute(
          name: 'settings',
          path: '/settings',
          builder: (context, state) => const CheckoutScreen(),
        ),
      ],
    ),
    GoRoute(
      name: 'validate',
      path: '/validate',
      builder: (context, state) => const CheckoutScreen(),
    ),
  ],
);
