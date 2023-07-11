// ignore_for_file: avoid_field_initializers_in_const_classes
import 'dart:developer';

import 'package:checkout/src/widgets/screens/card_input_screen/card_input_screen_view_model.dart';
import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

const String _cardTypeString = 'cardType';
const String _cardNumberString = 'cardNumber';
const String _expiryDateString = 'expiryDate';

class CheckoutCard extends Equatable {
  const CheckoutCard({
    required this.cardType,
    required this.cardNumber,
    required this.expirationDate,
  });

  factory CheckoutCard.fromJson(Map<String, dynamic> json) {
    inspect(json);
    return CheckoutCard(
      cardNumber: json[_cardNumberString] as String,
      expirationDate: json[_expiryDateString] as String,
      cardType: json[_cardTypeString] as CheckoutCardType,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      _cardTypeString: cardType,
      _cardNumberString: cardNumber,
      _expiryDateString: expirationDate,
    };
  }

  final id = const Uuid();

  final String cardNumber;

  final CheckoutCardType cardType;

  final String expirationDate;

  @override
  List<Object?> get props => [
        id,
      ];
}
