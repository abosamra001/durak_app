import 'package:flutter/material.dart';

import 'extensions.dart';

String? requiredFieldValidator(BuildContext context, String? value) {
  if (value != null && value.trim().isNotEmpty) {
    return null;
  } else {
    return context.locale.requiredfield;
  }
}

String? phoneValidator(BuildContext context, String? value) {
  final required = requiredFieldValidator(context, value);
  if (required != null) return required;
  return _isValidPhone(value!) ? null : context.locale.phonenotvalid;
}

bool _isValidPhone(String phone) {
  final normalized = _toAsciiDigits(phone).replaceAll(RegExp(r'[\s\-()]'), '');

  return RegExp(r'^(?:\+20|0020|0)?1[0125]\d{8}$').hasMatch(normalized);
}

String _toAsciiDigits(String input) {
  final buffer = StringBuffer();
  for (final rune in input.runes) {
    // Arabic-Indic digits ٠-٩ -> 0-9
    buffer.writeCharCode(
      rune >= 0x0660 && rune <= 0x0669 ? rune - 0x0660 + 0x30 : rune,
    );
  }
  return buffer.toString();
}
