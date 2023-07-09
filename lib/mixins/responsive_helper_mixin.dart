import 'package:flutter/widgets.dart';

mixin ResponsiveMixin {
  double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  bool isDesktop(BuildContext context) {
    return screenWidth(context) > 800;
  }

  bool isMobile(BuildContext context) {
    return !isDesktop(context);
  }
}
