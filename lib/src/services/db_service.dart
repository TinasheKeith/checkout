import 'dart:async';

import 'package:checkout/src/models/checkout_card_model.dart';
import 'package:hive_flutter/adapters.dart';

enum SaveCardResult {
  success,
  exists,
}

class DatabaseService {
  final String _boxName = 'cards';

  Future<SaveCardResult> saveCard(CheckoutCard card) async {
    final box = await Hive.openBox<CheckoutCard>(_boxName);

    if (!box.containsKey(card.id)) {
      await box.put(card.id, card);
      return SaveCardResult.success;
    }
    return SaveCardResult.exists;
  }

  Future<List<CheckoutCard>> getAllCards() async {
    final box = await Hive.openBox<CheckoutCard>(_boxName);
    return box.values.toList();
  }
}
