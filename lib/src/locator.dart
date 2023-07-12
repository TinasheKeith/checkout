import 'package:checkout/main.dart';
import 'package:checkout/src/services/db_service.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator(
  AppFlavor flavor,
) {
  locator.registerLazySingleton(
    DatabaseService.new,
  );
}
