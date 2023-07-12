import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

@immutable
class CheckoutTheme extends ThemeExtension<CheckoutTheme> {
  const CheckoutTheme({this.primaryColor = Colors.black});

  final Color primaryColor;

  ThemeData toThemeData() {
    final scheme = ColorScheme.fromSeed(seedColor: primaryColor);
    return _base(scheme).copyWith(
      brightness: scheme.brightness,
    );
  }

  @override
  ThemeExtension<CheckoutTheme> copyWith({Color? primary}) =>
      CheckoutTheme(primaryColor: primary ?? primaryColor);

  @override
  CheckoutTheme lerp(
    covariant ThemeExtension<CheckoutTheme>? other,
    double t,
  ) {
    if (other is! CheckoutTheme) return this;

    return CheckoutTheme(
      primaryColor: Color.lerp(primaryColor, other.primaryColor, t)!,
    );
  }

  ThemeData _base(ColorScheme colorScheme) {
    final isLight = colorScheme.brightness == Brightness.light;
    final primaryTextTheme = GoogleFonts.poppinsTextTheme();

    return ThemeData(
      useMaterial3: true,
      textTheme: primaryTextTheme,
      extensions: [this],
      colorScheme: colorScheme,
      scaffoldBackgroundColor: isLight ? Colors.white : Colors.black,
      appBarTheme: AppBarTheme(
        backgroundColor: isLight ? Colors.white : colorScheme.surface,
      ),
      dialogTheme: const DialogTheme(backgroundColor: Colors.white),
      buttonTheme: ButtonThemeData(
        minWidth: 100,
        height: 44,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: primaryColor,
        contentTextStyle: const TextStyle(
          color: Colors.white,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        elevation: 0,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(),
        counterStyle: TextStyle(color: Colors.transparent),
      ),
      floatingActionButtonTheme:
          const FloatingActionButtonThemeData(elevation: 0),
    );
  }
}
