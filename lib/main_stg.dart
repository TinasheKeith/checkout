import 'package:checkout/main.dart';
import 'package:checkout/src/app.dart';
import 'package:checkout/src/locator.dart';
import 'package:checkout/src/models/checkout_card_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {

  setupLocator(AppFlavor.staging);

  Hive.registerAdapter(CheckoutCardAdapter());

  await Hive.initFlutter();

  runApp(const App());
}
