import 'package:checkout/main.dart';
import 'package:checkout/src/app.dart';
import 'package:checkout/src/locator.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setupLocator(AppFlavor.development);

  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => const App(),
    ),
  );
}
