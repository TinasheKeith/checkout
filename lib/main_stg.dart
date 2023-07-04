import 'package:flutter/material.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'src/app.dart';

void main() async {
  const sentryEnvironment = "staging";

  await SentryFlutter.init(
    (options) {
      options.dsn =
          "https://e20157210f3d448eb61748c76fdd8581@o4505472229179392.ingest.sentry.io/4505472298516480";
      options.tracesSampleRate = 1.0;
      options.environment = sentryEnvironment;
    },
    appRunner: () => runApp(
      const App(),
    ),
  );
}
