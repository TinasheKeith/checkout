import 'package:checkout/src/locator.dart';
import 'package:checkout/src/models/checkout_card_model.dart';
import 'package:checkout/src/services/db_service.dart';
import 'package:flutter/material.dart';

class DashboardScreenViewModel extends ChangeNotifier {
  DashboardScreenViewModel() {
    getAllCards();
  }
  
  Future<void> getAllCards() async {
    await locator<DatabaseService>()
        .getAllCards()
        .then((value) => cards = value);
    notifyListeners();
  }

  List<CheckoutCard> cards = [];
}
