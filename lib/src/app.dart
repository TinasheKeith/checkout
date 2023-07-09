import 'package:checkout/routes/router.dart';
import 'package:checkout/theme/checkout_theme.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class App extends StatelessWidget {
  const App({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const checkoutThemeLight = CheckoutTheme();
    const checkoutThemeDark = CheckoutTheme(primaryColor: Colors.white);

    return MaterialApp.router(
      restorationScopeId: 'app',
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
      ],
      locale: DevicePreview.locale(context),
      onGenerateTitle: (BuildContext context) =>
          AppLocalizations.of(context)!.appTitle,
      theme: checkoutThemeLight.toThemeData(),
      darkTheme: checkoutThemeDark.toThemeData(),
      builder: DevicePreview.appBuilder,
      routerConfig: router,
    );
  }
}
