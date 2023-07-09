import 'package:checkout/src/constants.dart';
import 'package:flutter/material.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

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
