import 'package:checkout/src/constants.dart';
import 'package:flutter/material.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  static const name = 'dashboard';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          checkoutAppName,
          style:
              Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 30),
        ),
      ),
    );
  }
}
