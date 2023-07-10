import 'package:flutter/material.dart';

@immutable
class CheckoutNavbarItem {
  const CheckoutNavbarItem({
    required this.icon,
    required this.label,
  });

  final Icon icon;
  final String label;
}
