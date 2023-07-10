// ignore_for_file: unnecessary_parenthesis

import 'package:checkout/mixins/responsive_helper_mixin.dart';
import 'package:checkout/src/widgets/screens/card_input_screen/card_input_screen.dart';
import 'package:checkout/src/widgets/screens/dashboard_screen%20/dashboard_screen.dart';
import 'package:checkout/src/widgets/screens/settings_screen/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppScaffoldViewModel with ChangeNotifier, ResponsiveMixin {
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
          fullscreenDialog: true,
          builder: (BuildContext context) {
            return const Dialog.fullscreen(
              child: CardInputScreen(),
            );
          },
        ),
      );
    } else {
      showDialog<Widget>(
        context: context,
        builder: (context) {
          return ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: SizedBox(
              child: AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                content: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxHeight: 600,
                    minWidth: 350,
                  ),
                  child: const CardInputScreen(),
                ),
              ),
            ),
          );
        },
      );
    }
  }
}
