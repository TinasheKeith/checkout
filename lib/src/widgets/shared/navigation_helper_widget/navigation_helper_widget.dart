import 'package:checkout/src/widgets/shared/responsive_builder.dart';
import 'package:flutter/material.dart';

class NavigationHelperWidget extends StatelessWidget {
  const NavigationHelperWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      mobileWidget: mobileWidget,
      desktopWidget: desktopWidget,
    );
  }
}

class _MobileNavigation extends StatelessWidget {
  const _MobileNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
    );
  }
}
