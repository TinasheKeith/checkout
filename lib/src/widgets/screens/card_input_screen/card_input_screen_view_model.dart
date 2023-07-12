// ignore_for_file: lines_longer_than_80_chars

import 'package:checkout/asset_paths.dart';
import 'package:checkout/routes/router.dart';
import 'package:checkout/src/app.dart';
import 'package:checkout/src/locator.dart';
import 'package:checkout/src/models/checkout_card_model.dart';
import 'package:checkout/src/services/db_service.dart';
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

  const CheckoutCardType(this.cardTypeName);

  static CheckoutCardType fromString(String cardType) {
    return values.firstWhere(
      (value) => value.cardTypeName == cardType,
      orElse: () {
        return CheckoutCardType.unknown;
      },
    );
  }

  final String cardTypeName;

  String getLogoAssetPath() {
    switch (this) {
      case CheckoutCardType.visa:
        return Assets.visaLogo;
      case CheckoutCardType.mastercard:
        return Assets.mastercardLogo;
      case CheckoutCardType.americanExpress:
        return Assets.americanExpressLogo;
      case CheckoutCardType.unionPay:
        return Assets.unionPayLogo;
      case CheckoutCardType.discover:
        return Assets.discoverLogo;
      case CheckoutCardType.unknown:
        return '';
    }
  }

  Widget getLogoWidget(double? size) {
    switch (this) {
      case CheckoutCardType.visa:
        return Image.asset(
          Assets.visaLogo,
          height: size,
          semanticLabel: cardTypeName,
        );
      case CheckoutCardType.mastercard:
        return Image.asset(
          Assets.mastercardLogo,
          height: size,
          semanticLabel: cardTypeName,
        );
      case CheckoutCardType.americanExpress:
        return Image.asset(
          Assets.americanExpressLogo,
          height: size,
          semanticLabel: cardTypeName,
        );
      case CheckoutCardType.unionPay:
        return Image.asset(
          Assets.unionPayLogo,
          semanticLabel: cardTypeName,
        );
      case CheckoutCardType.discover:
        return Image.asset(
          Assets.discoverLogo,
          height: size,
          semanticLabel: cardTypeName,
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

  final formattedDateController = TextEditingController();
  String? _formattedDateErrorMessage;
  String? get formattedDateErrorMessage => _formattedDateErrorMessage;

  final cvvFieldController = TextEditingController();
  String? _cvvErrorMessage;
  String? get cvvErrorMessage => _cvvErrorMessage;

  final FocusNode _cardCVVFocusNode = FocusNode();
  FocusNode? get cardCVVFocusNode => _cardCVVFocusNode;

  final cardNumberController = TextEditingController();
  String? _cardNumberErrorMessage;
  String? get cardNumberErrorMessage => _cardNumberErrorMessage;

  bool _showCardBack = false;
  bool get showCardBack => _showCardBack;

  CheckoutCardType? _cardType;
  CheckoutCardType? get cardType => _cardType;

  set cardType(CheckoutCardType? card) {
    _cardType = card;
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

  String? validateCVV(String? cvv) {
    if (cvv == null || cvv.isEmpty) {
      return 'CVV is required';
    } else if (!(cvv.length == 3 || cvv.length == 4)) {
      return 'CVV must be 3 or 4 digits';
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

    formattedDateController.text = formatDate(chosenDate, [m, '/', yy]);
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

  Future<void> saveCard() async {
    final result = await locator<DatabaseService>().saveCard(
      CheckoutCard(
        assetPath: cardType!.getLogoAssetPath(),
        cardType: cardType!.cardTypeName,
        cardNumber: cardNumberController.text,
        expirationDate: formattedDateController.text,
      ),
    );

    if (result == SaveCardResult.exists) {
      scaffoldKey.currentState?.showSnackBar(
        const SnackBar(
          content: Text('Card already saved!'),
        ),
      );
    }

    if (result == SaveCardResult.success) {
      router.pop();
    }
  }
}
