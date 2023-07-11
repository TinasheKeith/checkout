// ignore_for_file: lines_longer_than_80_chars

import 'package:checkout/asset_paths.dart';
import 'package:checkout/src/app.dart';
import 'package:checkout/src/locator.dart';
import 'package:checkout/src/models/checkout_card_model.dart';
import 'package:checkout/src/services/shared_preferences_service.dart';
import 'package:credit_card_validator/credit_card_validator.dart';
import 'package:date_format/date_format.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

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
  CardInputScreenViewModel() {
    _cardCVVFocusNode.addListener(() {
      if (_cardCVVFocusNode.hasFocus) {
        _showCardBack = true;
        notifyListeners();
        return;
      }

      _showCardBack = false;
      notifyListeners();
    });
  }

  final _validator = CreditCardValidator();

  final _formattedDateController = TextEditingController();

  final _cardNumberController = TextEditingController();

  String? _cardCVV;
  final FocusNode _cardCVVFocusNode = FocusNode();
  TextEditingController get cvvFieldController => TextEditingController();

  String? get cardCvv => _cardCVV;
  FocusNode? get cardCVVFocusNode => _cardCVVFocusNode;

  bool _showCardBack = false;

  CheckoutCardType? _cardType;
  DateTime? _selectedExpirationDate;
  String? _cardNumberErrorMessage;
  String? _formattedDateErrorMessage;

  bool get showCardBack => _showCardBack;

  String? get cardNumberErrorMessage => _cardNumberErrorMessage;
  String? get formattedDateErrorMessage => _formattedDateErrorMessage;
  CheckoutCardType? get cardType => _cardType;

  TextEditingController get cardNumberController => _cardNumberController;
  TextEditingController get formattedDateController => _formattedDateController;

  DateTime? get selectedDate => _selectedExpirationDate;

  set cardType(CheckoutCardType? card) {
    _cardType = card;
    notifyListeners();
  }

  set selectedDate(DateTime? date) {
    _selectedExpirationDate = date;
    notifyListeners();
  }

  String? validateCardNumber(
    String? cardNumber, {
    // Making this optional because ideally we don't want to validate this as the user is typing
    bool validateLength = true,
  }) {
    if (cardNumber == null || cardNumber.isEmpty) {
      return 'Card number is required';
    } else if (validateLength && cardNumber.length < 15) {
      return 'Card number length is invalid';
    }

    _getCardTypeFromCardNumber(cardNumber);

    if (cardNumberErrorMessage != null) {
      return cardNumberErrorMessage;
    }

    return null;
  }

  String? validateExpirationDate(String? date) {
    if (date == null || date.isEmpty) return 'Expiry date is required';

    final result = _validator.validateExpDate(date);

    if (result.message.isNotEmpty) {
      return _formattedDateErrorMessage = result.message;
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

    _formattedDateController.text = formatDate(chosenDate, [m, '/', yy]);
    notifyListeners();
  }

  void _getCardTypeFromCardNumber(String cardNumber) {
    final result = _validator.validateCCNum(cardNumber);
    if (result.message.isNotEmpty) {
      _cardNumberErrorMessage = result.message;
      _cardType = null;
      notifySafely();
      return;
    }

    if (result.isPotentiallyValid) {
      _cardNumberErrorMessage = null;
      _cardType = CheckoutCardType.fromString(result.ccType.prettyType);
      notifySafely();
    }
  }

  void notifySafely() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
  }

  void saveCard() async {
    final result = await locator<SharedPreferencesService>().saveCard(
      CheckoutCard(
        cardType: _cardType!,
        cardNumber: cardNumberController.text,
        expirationDate: _formattedDateController.text,
      ),
    );

    if (result == SaveCardResponse.exists) {
      scaffoldKey.currentState?.showSnackBar(
        const SnackBar(
          content: Text('Card already saved!'),
        ),
      );
    }

    if (result == SaveCardResponse.success) {
      scaffoldKey.currentState?.showSnackBar(
        const SnackBar(
          content: Text('Saved!'),
        ),
      );
    }
  }
}
