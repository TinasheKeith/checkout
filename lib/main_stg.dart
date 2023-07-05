import 'package:checkout/src/app.dart';
import 'package:checkout/src/constants.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

void main() async {
  const sentryEnvironment = 'staging';

  await SentryFlutter.init(
    (options) {
      options
        ..dsn = sentryDsn
        ..tracesSampleRate = 1.0
        ..environment = sentryEnvironment;
    },
    appRunner: () => runApp(
      DevicePreview(
        builder: (context) => const App(),
      ),
    ),
  );
}
