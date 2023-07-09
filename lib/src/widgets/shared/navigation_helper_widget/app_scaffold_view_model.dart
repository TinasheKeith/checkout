import 'package:checkout/routes/router.dart';
import 'package:checkout/src/widgets/screens/dashboard_screen%20/dashboard_screen.dart';
import 'package:checkout/src/widgets/screens/settings_screen/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppScaffoldViewModel {
  int _currentScreenIndex = 0;

  int get currentScreenIndex => _currentScreenIndex;

  void navigateToDashboard(BuildContext context) {
    context.goNamed(SettingsScreen.name);
    print('pushed to navigateToDashboard screen!');
    _currentScreenIndex = 0;
  }

  void navigateToSettings(BuildContext context) {
    context.goNamed(SettingsScreen.name);
    print('pushed to navigateToSettings screen!');
    _currentScreenIndex = 1;
  }

  void navigateToCardValidation() {
    router.push(CheckoutScreen.name);
  }
}
