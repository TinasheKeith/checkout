import 'package:checkout/src/app.dart';
import 'package:checkout/src/constants.dart';
import 'package:checkout/src/services/db_service.dart';
import 'package:flutter/material.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

void main() async {
  const sentryEnvironment = 'staging';

  // ignore: unused_local_variable
  final dbService = DatabaseService();

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
