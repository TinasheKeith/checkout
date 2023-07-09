import 'package:checkout/routes/router.dart';
import 'package:checkout/src/widgets/screens/dashboard_screen%20/dashboard_screen.dart';
import 'package:flutter/material.dart';

class AppScaffoldViewModel {
  void navigateToDashboard() {
    router.push(CheckoutScreen.name);
  }

  void navigateToSettings() {
    router.push(CheckoutScreen.name);
  }

  void navigateToCardValidation() {
    router.push(CheckoutScreen.name);
  }

  int getSelectedIndex(BuildContext context) {
    final currentRoute = ModalRoute.of(context)?.settings.name;

    switch (currentRoute) {
      case '/':
        return 0;
      case '/settings':
        return 1;

      default:
        return 0;
    }
  }
}
