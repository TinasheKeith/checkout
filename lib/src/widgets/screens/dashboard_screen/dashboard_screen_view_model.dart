import 'package:checkout/src/locator.dart';
import 'package:checkout/src/models/checkout_card_model.dart';
import 'package:checkout/src/services/shared_preferences_service.dart';
import 'package:flutter/material.dart';

class DashboardScreenViewModel extends ChangeNotifier {
  DashboardScreenViewModel() {
    _getCards();
  }

  Future<void> _getCards() async {
    final savedCards =
        await locator<SharedPreferencesService>().getSavedCards();

    cards = savedCards;
    notifyListeners();
  }

  List<CheckoutCard> cards = [];
}
