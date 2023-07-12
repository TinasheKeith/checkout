import 'package:checkout/src/app.dart';
import 'package:checkout/src/constants.dart';
import 'package:checkout/src/locator.dart';
import 'package:checkout/src/models/checkout_card_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

enum AppFlavor {
  development,
  staging,
  prod,
}

void main() async {
  setupLocator(AppFlavor.prod);

  await Hive.initFlutter();

  Hive.registerAdapter(CheckoutCardAdapter()); 

  await SentryFlutter.init(
    (options) {
      options
        ..dsn = sentryDsn
        ..tracesSampleRate = 1.0
        ..environment = AppFlavor.prod.name;
    },
    appRunner: () => runApp(
      const App(),
    ),
  );
}
