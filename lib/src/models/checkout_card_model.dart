import 'package:checkout/src/widgets/screens/card_input_screen/card_input_screen_view_model.dart';
import 'package:isar/isar.dart';

part 'checkout_card_model.g.dart';

@collection
class CheckoutCard {
  CheckoutCard({
    required this.cardType,
    required this.cardNumber,
    required this.expirationDate,
  });

  Id id = Isar.autoIncrement;

  late String cardNumber;

  @enumerated
  late CheckoutCardType cardType;

  late String expirationDate;
}
