import 'package:checkout/main.dart';
import 'package:checkout/src/app.dart';
import 'package:checkout/src/constants.dart';
import 'package:checkout/src/locator.dart';
import 'package:checkout/src/models/checkout_card_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

void main() async {
  const sentryEnvironment = 'staging';

  setupLocator(AppFlavor.staging);

  Hive.registerAdapter(CheckoutCardAdapter());

  await Hive.initFlutter();

  await SentryFlutter.init(
    (options) {
      options
        ..dsn = sentryDsn
        ..tracesSampleRate = 1.0
        ..environment = sentryEnvironment;
    },
    appRunner: () => runApp(
      const App(),
    ),
  );
}
