import 'package:checkout/src/widgets/screens/dashboard_screen%20/dashboard_screen.dart';
import 'package:checkout/src/widgets/screens/settings_screen/settings_screen.dart';
import 'package:checkout/src/widgets/shared/navigation_helper_widget/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root_navigator');

final GlobalKey<NavigatorState> _shellNavigator =
    GlobalKey<NavigatorState>(debugLabel: 'dashboard_navigator');

GoRouter router = GoRouter(
  initialLocation: '/dashboard',
  navigatorKey: _rootNavigatorKey,
  debugLogDiagnostics: true,
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigator,
      builder: (context, state, child) {
        return AppScaffold(
          child: child,
        );
      },
      routes: [
        GoRoute(
          path: '/dashboard',
          pageBuilder: (context, state) => NoTransitionPage(
            child: DashboardScreen(
              key: state.pageKey,
            ),
          ),
        ),
        GoRoute(
          path: '/settings',
          pageBuilder: (context, state) => NoTransitionPage(
            child: SettingsScreen(
              key: state.pageKey,
            ),
          ),
        ),
      ],
    ),
  ],
);
