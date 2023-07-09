import 'package:checkout/src/models/co_navbar_item.dart';
import 'package:checkout/src/widgets/shared/logo.dart';
import 'package:checkout/src/widgets/shared/navigation_helper_widget/app_scaffold_view_model.dart';
import 'package:checkout/src/widgets/shared/responsive_builder.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppScaffold extends StatefulWidget {
  const AppScaffold({
    required this.navigationShell,
    super.key,
  });

  final StatefulNavigationShell navigationShell;

  @override
  State<AppScaffold> createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
  late final AppScaffoldViewModel _viewModel;

  @override
  void initState() {
    _viewModel = AppScaffoldViewModel(widget.navigationShell);
    super.initState();
  }

  final List<CheckoutNavbarItem> _navbarItems = [
    const CheckoutNavbarItem(
      icon: Icon(EvaIcons.activityOutline),
      label: 'Dashboard',
    ),
    const CheckoutNavbarItem(
      icon: Icon(EvaIcons.options2Outline),
      label: 'Settings',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      mobileWidget: _MobileAppScaffold(
        _navbarItems,
        _viewModel,
      ),
      desktopWidget: _DesktopAppScaffold(
        _navbarItems,
        _viewModel,
      ),
    );
  }
}

class _MobileAppScaffold extends StatelessWidget {
  const _MobileAppScaffold(this._navbarItems, this._viewModel);

  final List<CheckoutNavbarItem> _navbarItems;
  final AppScaffoldViewModel _viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _viewModel.navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _viewModel.navigationShell.currentIndex,
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
  const _DesktopAppScaffold(this._navbarItems, this._viewModel);

  final List<CheckoutNavbarItem> _navbarItems;
  final AppScaffoldViewModel _viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
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
            leading: const CheckoutLogo(),
            useIndicator: true,
            destinations: _navbarItems
                .map(
                  (navItem) => NavigationRailDestination(
                    icon: navItem.icon,
                    label: Text(navItem.label),
                  ),
                )
                .toList(),
            selectedIndex: _viewModel.navigationShell.currentIndex,
          ),
          Expanded(child: _viewModel.navigationShell),
        ],
      ),
    );
  }
}
