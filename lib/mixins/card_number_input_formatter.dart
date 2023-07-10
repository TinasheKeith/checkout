import 'package:flutter/services.dart';

class CardTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String? newText = newValue.text;

    if (oldValue.text.length >= newValue.text.length) return newValue;

    if (newText.length % 5 == 4) {
      newText = '${newValue.text} ';
    }

    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
