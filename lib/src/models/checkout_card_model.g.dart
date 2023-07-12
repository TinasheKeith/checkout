// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_card_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CheckoutCardAdapter extends TypeAdapter<CheckoutCard> {
  @override
  final int typeId = 0;

  @override
  CheckoutCard read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CheckoutCard(
      assetPath: fields[5] as String,
      cardType: fields[2] as String,
      cardNumber: fields[1] as String,
      expirationDate: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CheckoutCard obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.cardNumber)
      ..writeByte(2)
      ..write(obj.cardType)
      ..writeByte(3)
      ..write(obj.expirationDate)
      ..writeByte(5)
      ..write(obj.assetPath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CheckoutCardAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
