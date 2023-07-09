import 'package:flutter/material.dart';

enum AppScreen {
  dashboard,
  settings,
}

class NavigationHelperViewModel extends ChangeNotifier {
  AppScreen _currentScreen = AppScreen.dashboard;

  int get currentScreenIndex => _currentScreen.index;

  void navigateToDashboard() {
    _currentScreen = AppScreen.dashboard;
    notifyListeners();
  }

  void navigateToSettings() {
    _currentScreen = AppScreen.settings;
    notifyListeners();
  }

  void navigateTo(AppScreen screen) {
    _currentScreen = screen;
    notifyListeners();
  }
}
