import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'checkout_card_model.g.dart';

@HiveType(typeId: 0)
class CheckoutCard {
  CheckoutCard({
    required this.assetPath,
    required this.cardType,
    required this.cardNumber,
    required this.expirationDate,
  }) : id = const Uuid().v4();

  @HiveField(0)
  final String id;

  @HiveField(1)
  final String cardNumber;

  @HiveField(2)
  final String cardType;

  @HiveField(3)
  final String expirationDate;

  @HiveField(5)
  final String assetPath;
}
