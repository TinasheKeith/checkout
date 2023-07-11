import 'dart:convert';

import 'package:checkout/src/models/checkout_card_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum SaveCardResponse {
  success,
  exists,
  failed,
}

class SharedPreferencesService {
  SharedPreferencesService(String flavor) {
    _storageKey = flavor;
  }

  late String _storageKey;

  SharedPreferences? _preferences;

  Future<SharedPreferences> get preferences async {
    return _preferences ??= await SharedPreferences.getInstance();
  }

  Future<SaveCardResponse> saveCard(CheckoutCard card) async {
    final key = '$_storageKey/cards';
    final prefs = await preferences;

    final savedCards = prefs.getStringList(key) ?? <String>[];

    try {
      final existingLocationIndex = savedCards.indexWhere((savedCardJson) {
        final savedCard = CheckoutCard.fromJson(
          jsonDecode(savedCardJson) as Map<String, dynamic>,
        );

        return savedCard == card;
      });

      if (existingLocationIndex >= 0) {
        return SaveCardResponse.exists;
      }

      final cardJson = jsonEncode(card.toJson());
      savedCards.add(cardJson);

      await prefs.setStringList(key, savedCards);
      return SaveCardResponse.success;
    } catch (e) {
      return SaveCardResponse.failed;
    }
  }

  Future<List<CheckoutCard>> getSavedCards() async {
    final key = '$_storageKey/cards';
    final prefs = await preferences;
    final cardsList = prefs.getStringList(key) ?? <String>[];

    return cardsList
        .map(
          (savedCardJson) => CheckoutCard.fromJson(
            jsonDecode(
              savedCardJson,
            ) as Map<String, dynamic>,
          ),
        )
        .toList();
  }
}
