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
        navbarItems: _navbarItems,
        viewModel: _viewModel,
        onDestinationSelected: (value) {
          context.go('/dashboard');
        },
        onStartValidateCardTapped: () =>
            _viewModel.openValidateCardScreen(context),
        child: widget.child,
      ),
      desktopWidget: _DesktopAppScaffold(
        viewModel: _viewModel,
        onDestinationSelected: (value) {
          context.go('/settings');
        },
        navbarItems: _navbarItems,
        onStartValidateCardTapped: () =>
            _viewModel.openValidateCardScreen(context, isMobile: false),
        child: widget.child,
      ),
    );
  }
}

class _MobileAppScaffold extends StatelessWidget {
  const _MobileAppScaffold({
    required this.navbarItems,
    required this.viewModel,
    required this.onDestinationSelected,
    required this.child,
    required this.onStartValidateCardTapped,
  });

  final List<CheckoutNavbarItem> navbarItems;
  final AppScaffoldViewModel viewModel;
  final ValueChanged<int> onDestinationSelected;
  final Widget child;
  final VoidCallback onStartValidateCardTapped;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: viewModel.selectedIndex,
        items: navbarItems
            .map(
              (navItem) => BottomNavigationBarItem(
                icon: navItem.icon,
                label: navItem.label,
              ),
            )
            .toList(),
        onTap: (value) => viewModel.goBranch(context, value),
      ),
      floatingActionButton: _CardValidationButton(
        showExtended: false,
        onPressed: onStartValidateCardTapped,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
    );
  }
}

class _DesktopAppScaffold extends StatelessWidget {
  const _DesktopAppScaffold({
    required this.navbarItems,
    required this.viewModel,
    required this.onDestinationSelected,
    required this.child,
    required this.onStartValidateCardTapped,
  });

  final List<CheckoutNavbarItem> navbarItems;
  final AppScaffoldViewModel viewModel;
  final Widget child;
  final ValueChanged<int> onDestinationSelected;
  final VoidCallback onStartValidateCardTapped;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: viewModel.selectedIndex,
            onDestinationSelected: (value) =>
                viewModel.goBranch(context, value),
            leading: const CheckoutLogo(),
            useIndicator: true,
            destinations: navbarItems
                .map(
                  (navItem) => NavigationRailDestination(
                    icon: navItem.icon,
                    label: Text(navItem.label),
                  ),
                )
                .toList(),
          ),
          const VerticalDivider(width: 1),
          Expanded(child: child),
        ],
      ),
      floatingActionButton: _CardValidationButton(
        onPressed: onStartValidateCardTapped,
      ),
    );
  }
}

class _CardValidationButton extends StatelessWidget {
  const _CardValidationButton({
    required this.onPressed,
    this.showExtended = true,
  });

  final bool showExtended;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return showExtended
        ? FloatingActionButton.extended(
            tooltip: 'Validate a credit card',
            onPressed: onPressed,
            icon: const Icon(EvaIcons.plusCircleOutline),
            label: const Text('validate'),
          )
        : Transform.rotate(
            angle: 45 / 180.0 * 3.1415926,
            child: FloatingActionButton(
              onPressed: onPressed,
              child: const Icon(EvaIcons.plusCircle),
            ),
          );
  }
}
