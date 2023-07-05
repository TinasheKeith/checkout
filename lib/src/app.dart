import 'package:checkout/src/constants.dart';
import 'package:checkout/src/widgets/screens/checkout_screen.dart';
import 'package:checkout/theme/checkout_theme.dart';
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

    return MaterialApp(
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
      onGenerateTitle: (BuildContext context) =>
          AppLocalizations.of(context)!.appTitle,
      theme: checkoutThemeLight.toThemeData(),
      darkTheme: checkoutThemeDark.toThemeData(),
      onGenerateRoute: (RouteSettings routeSettings) {
        return MaterialPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context) {
            switch (routeSettings.name) {
              case checkoutRouteName:
                const CheckoutScreen();
            }

            return const CheckoutScreen();
          },
        );
      },
    );
  }
}
