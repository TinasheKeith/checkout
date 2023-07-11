import 'package:checkout/src/app.dart';
import 'package:checkout/src/services/db_service.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // ignore: unused_local_variable
  final dbService = DatabaseService();

  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => const App(),
    ),
  );
}
