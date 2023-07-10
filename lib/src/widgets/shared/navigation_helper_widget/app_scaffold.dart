import 'package:checkout/src/models/co_navbar_item.dart';
import 'package:checkout/src/widgets/shared/logo.dart';
import 'package:checkout/src/widgets/shared/navigation_helper_widget/app_scaffold_view_model.dart';
import 'package:checkout/src/widgets/shared/responsive_builder.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppScaffold extends StatefulWidget {
  const AppScaffold({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  State<AppScaffold> createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
  late final AppScaffoldViewModel _viewModel;

  @override
  void initState() {
    _viewModel = AppScaffoldViewModel();
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
        (value) {
          context.go('/dashboard');
        },
        widget.child,
      ),
      desktopWidget: _DesktopAppScaffold(
        _navbarItems,
        _viewModel,
        (value) {
          context.go('/settings');
        },
        widget.child,
      ),
    );
  }
}

class _MobileAppScaffold extends StatelessWidget {
  const _MobileAppScaffold(
    this._navbarItems,
    this._viewModel,
    this.onDestinationSelected,
    this.child,
  );

  final List<CheckoutNavbarItem> _navbarItems;
  final AppScaffoldViewModel _viewModel;
  final ValueChanged<int> onDestinationSelected;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _viewModel.selectedIndex,
        items: _navbarItems
            .map(
              (navItem) => BottomNavigationBarItem(
                icon: navItem.icon,
                label: navItem.label,
              ),
            )
            .toList(),
        onTap: (value) => _viewModel.goBranch(context, value),
      ),
    );
  }
}

class _DesktopAppScaffold extends StatelessWidget {
  const _DesktopAppScaffold(
    this._navbarItems,
    this._viewModel,
    this.onDestinationSelected,
    this.child,
  );

  final List<CheckoutNavbarItem> _navbarItems;
  final AppScaffoldViewModel _viewModel;
  final Widget child;
  final ValueChanged<int> onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: _viewModel.selectedIndex,
            onDestinationSelected: (value) =>
                _viewModel.goBranch(context, value),
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
          ),
          Expanded(child: child),
        ],
      ),
    );
  }
}
