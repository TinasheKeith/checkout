import 'package:checkout/main.dart';
import 'package:checkout/src/services/shared_preferences_service.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator(
  AppFlavor flavor,
) {
  locator.registerLazySingleton(
    () => SharedPreferencesService(flavor.name),
  );
}
