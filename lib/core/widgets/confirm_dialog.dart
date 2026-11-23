import 'package:flutter/material.dart';

import '../helpers/extensions.dart';

Future<bool> showConfirmDailog(BuildContext context, String contentText) async {
  final result = await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        content: Text(
          contentText,
          style: context.themeData.textTheme.bodyLarge,
        ),
        actionsAlignment: .center,
        actions: [
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(context.locale.confirm),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(context.locale.cancel),
          ),
        ],
      );
    },
  );
  return result ?? false;
}
