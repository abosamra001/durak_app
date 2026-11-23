import 'package:flutter/material.dart';

import '../helpers/extensions.dart';

void showErrorSnackBar(BuildContext context) {
  ScaffoldMessenger.of(
    context,
  ).showSnackBar(SnackBar(content: Text(context.locale.somethingWentWrong)));
}
