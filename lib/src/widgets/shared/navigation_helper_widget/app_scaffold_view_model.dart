import 'package:checkout/routes/router.dart';
import 'package:checkout/src/widgets/screens/dashboard_screen%20/dashboard_screen.dart';
import 'package:checkout/src/widgets/screens/settings_screen/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppScaffoldViewModel {
  AppScaffoldViewModel(this.navigationShell);

  final StatefulNavigationShell navigationShell;

  void navigateToDashboard(BuildContext context) {
    context.goNamed(DashboardScreen.name);
  }

  void navigateToSettings(BuildContext context) {
    context.goNamed(SettingsScreen.name);
  }

  void navigateToCardValidation() {
    router.push(DashboardScreen.name);
  }

  void goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}
