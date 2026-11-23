import 'package:flutter/material.dart';

import 'extensions.dart';

String? phoneValidator(BuildContext context, String? value) {
  if (!_isValidPhone(value)) {
    return context.locale.phonenotvalid;
  }
  return requiredFieldValidator(context, value);
}

bool _isValidPhone(String? phone) {
  if (phone == null) return false;
  final normalized = phone.replaceAll(RegExp(r'[\s\-()]'), '');

  return RegExp(r'^(?:\+20|0020|0)?1[0125]\d{8}$').hasMatch(normalized);
}

String? requiredFieldValidator(BuildContext context, String? value) {
  if (value != null && value.trim().isNotEmpty) {
    return null;
  } else {
    return context.locale.requiredfield;
  }
}
