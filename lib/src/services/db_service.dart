// import 'package:checkout/src/models/checkout_card_model.dart';
// import 'package:isar/isar.dart';
// import 'package:path_provider/path_provider.dart';

// class DatabaseService {
//   DatabaseService() {
//     db = openDb();
//   }

//   late Future<Isar> db;

//   Future<Isar> openDb({bool showInspector = true}) async {
//     final dir = await getApplicationDocumentsDirectory();
//     if (Isar.instanceNames.isEmpty) {
//       return Isar.open(
//         [CheckoutCardSchema],
//         directory: dir.path,
//         inspector: showInspector,
//       );
//     }

//     return Future.value(Isar.getInstance());
//   }

//   Stream<List<CheckoutCard>> getCheckoutCardsStream() async* {
//     final isar = await db;

//     yield* isar.checkoutCards.where().watch(fireImmediately: true);
//   }

//   Future<void> saveCard(CheckoutCard card) async {
//     final isar = await db;

//     final cardExists = isar.checkoutCards
//             .filter()
//             .cardNumberEqualTo(card.cardNumber)
//             .findFirstSync() !=
//         null;

//     if (cardExists) return;

//     await isar.writeTxn(
//       () => isar.checkoutCards.put(card),
//     );
//   }
// }
