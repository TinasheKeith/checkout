import 'package:checkout/mixins/responsive_helper_mixin.dart';
import 'package:flutter/material.dart';

class ResponsiveBuilder extends StatelessWidget with ResponsiveMixin {
  ResponsiveBuilder({
    required this.mobileWidget,
    required this.desktopWidget,
    super.key,
  });

  final Widget mobileWidget;
  final Widget desktopWidget;

  @override
  Widget build(BuildContext context) {
    if (isMobile(context)) {
      return mobileWidget;
    } else {
      return desktopWidget;
    }
  }
}
