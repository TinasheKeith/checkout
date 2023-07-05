import 'package:checkout/src/constants.dart';
import 'package:flutter/material.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'src/app.dart';

void main() async {
  const sentryEnvironment = "prod";

  await SentryFlutter.init(
    (options) {
      options.dsn = sentryDsn;
      options.tracesSampleRate = 1.0;
      options.environment = sentryEnvironment;
    },
    appRunner: () => runApp(
      const App(),
    ),
  );
}
