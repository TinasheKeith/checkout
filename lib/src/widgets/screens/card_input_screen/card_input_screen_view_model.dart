import 'package:checkout/asset_paths.dart';
import 'package:credit_card_validator/credit_card_validator.dart';
import 'package:date_format/date_format.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
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

  Widget getLogoAsset(double? size) {
    switch (this) {
      case CheckoutCardType.visa:
        return Image.asset(
          Assets.visaLogo,
          height: size,
          semanticLabel: cardType,
        );
      case CheckoutCardType.mastercard:
        return Image.asset(
          Assets.mastercardLogo,
          height: size,
          semanticLabel: cardType,
        );
      case CheckoutCardType.americanExpress:
        return Image.asset(
          Assets.americanExpressLogo,
          height: size,
          semanticLabel: cardType,
        );
      case CheckoutCardType.unionPay:
        return Image.asset(
          Assets.unionPayLogo,
          semanticLabel: cardType,
        );
      case CheckoutCardType.discover:
        return Image.asset(
          Assets.discoverLogo,
          height: size,
          semanticLabel: cardType,
        );
      case CheckoutCardType.unknown:
        return const Icon(EvaIcons.creditCard);
    }
  }
}

class CardInputScreenViewModel with ChangeNotifier {
  final _validator = CreditCardValidator();
  final _cardNumberController = TextEditingController();
  final _formattedDateController = TextEditingController();

  String? _cardCVV;
  String? _errorMessage;
  CheckoutCardType? _cardType;
  DateTime? _selectedDate;

  String? get cardCvv => _cardCVV;
  String? get errorMessage => _errorMessage;
  CheckoutCardType? get cardType => _cardType;
  TextEditingController get cardNumberController => _cardNumberController;
  TextEditingController get formattedDateController => _formattedDateController;

  DateTime? get selectedDate => _selectedDate;

  set cardType(CheckoutCardType? card) {
    _cardType = card;
    notifyListeners();
  }

  set selectedDate(DateTime? date) {
    _selectedDate = date;
    notifyListeners();
  }

  String? validateCardNumber(String? cardNumber) {
    if (cardNumber == null || cardNumber.isEmpty) {
      return 'Card number is required';
    }

    _getCardType(cardNumber);

    if (errorMessage != null) {
      return errorMessage;
    }

    return null;
  }

  Future<void> selectExpiryDate(BuildContext context) async {
    final today = DateTime.now();

    final chosenDate = await showDatePicker(
      context: context,
      initialDate: today,
      firstDate: today,
      lastDate: today.add(
        const Duration(days: 4000),
      ),
    );

    if (chosenDate == null) return;

    _formattedDateController.text = formatDate(chosenDate, [MM, '/', yy]);
    notifyListeners();
  }

  void _getCardType(String cardNumber) {
    final result = _validator.validateCCNum(cardNumber);
    if (result.message.isNotEmpty) {
      _errorMessage = result.message;
      _cardType = null;
      notifyListeners();
      return;
    }

    if (result.isPotentiallyValid) {
      _errorMessage = null;
      _cardType = CheckoutCardType.fromString(result.ccType.prettyType);
      notifyListeners();
    }
  }

  void validateCvv(String cvv) {}
}
