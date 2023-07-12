import 'package:checkout/main.dart';
import 'package:checkout/src/app.dart';
import 'package:checkout/src/locator.dart';
import 'package:checkout/src/models/checkout_card_model.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setupLocator(AppFlavor.development);

  Hive.registerAdapter(CheckoutCardAdapter());

  await Hive.initFlutter();

  runApp(
    DevicePreview(
      builder: (context) => const App(),
    ),
  );
}
