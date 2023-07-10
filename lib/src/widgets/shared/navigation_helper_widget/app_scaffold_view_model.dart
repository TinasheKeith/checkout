import 'package:checkout/src/widgets/screens/card_input_screen/card_input_screen.dart';
import 'package:checkout/src/widgets/screens/dashboard_screen%20/dashboard_screen.dart';
import 'package:checkout/src/widgets/screens/settings_screen/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppScaffoldViewModel with ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void navigateToDashboard(BuildContext context) {
    context.goNamed(DashboardScreen.name);
  }

  void navigateToSettings(BuildContext context) {
    context.goNamed(SettingsScreen.name);
  }

  void goBranch(BuildContext context, int index) {
    _selectedIndex = index;
    final router = GoRouter.of(context);

    switch (index) {
      case 0:
        router.go('/dashboard');
      case 1:
        router.go('/settings');

      default:
        router.go('/dashboard');
    }
  }

  void openValidateCardScreen(BuildContext context, {bool isMobile = true}) {
    if (isMobile) {
      Navigator.of(context).push(
        MaterialPageRoute<Widget>(
          builder: (BuildContext context) {
            return const CardInputScreen();
          },
        ),
      );
    } else {
      showDialog<Widget>(
        context: context,
        builder: (context) {
          return const CardInputScreen();
        },
      );
    }
  }
}
