import 'package:credit_card_validator/credit_card_validator.dart';
import 'package:flutter/material.dart';

enum CheckoutCardType {
  visa('Visa'),
  mastercard('Mastercard'),
  americanExpress('American Express'),
  discover('Discover'),
  unionPay('UnionPay'),
  unknown('Unknown');

  const CheckoutCardType(this.cardType);

  static CheckoutCardType fromString(String cardType) {
    return values.firstWhere(
      (value) => value.cardType == cardType,
      orElse: () {
        return CheckoutCardType.unknown;
      },
    );
  }

  final String cardType;
}

class CardInputScreenViewModel with ChangeNotifier {
  final _validator = CreditCardValidator();
  final _cardNumberController = TextEditingController();

  String? _cardCVV;
  String? _errorMessage;
  CheckoutCardType? _cardType;
  DateTime? _selectedDate;

  String? get cardCvv => _cardCVV;
  String? get errorMessage => _errorMessage;
  CheckoutCardType? get cardType => _cardType;
  TextEditingController get cardNumberController => _cardNumberController;
  DateTime? get selectedDate => _selectedDate;

  void validateCardNumber(String cardNumber) {
    _getCardType(cardNumber);
  }

  void _getCardType(String cardNumber) {
    final result = _validator.validateCCNum(cardNumber);

    if (result.message.isNotEmpty) {
      _errorMessage = result.message;
      return;
    }

    if (result.isPotentiallyValid) {
      _errorMessage = null;
      _cardType = CheckoutCardType.fromString(result.ccType.prettyType);
      notifyListeners();
    }
  }
}
