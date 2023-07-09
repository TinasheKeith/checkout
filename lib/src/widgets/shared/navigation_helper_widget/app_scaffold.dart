import 'package:checkout/src/models/co_navbar_item.dart';
import 'package:checkout/src/widgets/shared/navigation_helper_widget/app_scaffold_view_model.dart';
import 'package:checkout/src/widgets/shared/responsive_builder.dart';
import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  AppScaffold({super.key});

  final List<CheckoutNavbarItem> _navbarItems = [
    const CheckoutNavbarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    const CheckoutNavbarItem(
      icon: Icon(Icons.settings),
      label: 'Settings',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      mobileWidget: _MobileAppScaffold(_navbarItems),
      desktopWidget: _DesktopAppScaffold(_navbarItems),
    );
  }
}

class _MobileAppScaffold extends StatelessWidget {
  _MobileAppScaffold(this._navbarItems);

  final List<CheckoutNavbarItem> _navbarItems;
  final _viewModel = AppScaffoldViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _viewModel.currentScreenIndex,
        items: _navbarItems
            .map(
              (navItem) => BottomNavigationBarItem(
                icon: navItem.icon,
                label: navItem.label,
              ),
            )
            .toList(),
        onTap: (value) {
          switch (value) {
            case 0:
              _viewModel.navigateToDashboard(context);
            case 1:
              _viewModel.navigateToSettings(context);

            default:
              _viewModel.navigateToDashboard(context);
          }
        },
      ),
    );
  }
}

class _DesktopAppScaffold extends StatelessWidget {
  _DesktopAppScaffold(this._navbarItems);

  final List<CheckoutNavbarItem> _navbarItems;
  final _viewModel = AppScaffoldViewModel();

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      onDestinationSelected: (value) {
        switch (value) {
          case 0:
            _viewModel.navigateToDashboard(context);
          case 1:
            _viewModel.navigateToSettings(context);

          default:
            _viewModel.navigateToDashboard(context);
        }
      },
      destinations: _navbarItems
          .map(
            (navItem) => NavigationRailDestination(
              icon: navItem.icon,
              label: Text(navItem.label),
            ),
          )
          .toList(),
      selectedIndex: _viewModel.currentScreenIndex,
    );
  }
}
