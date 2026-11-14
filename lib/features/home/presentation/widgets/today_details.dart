import 'package:flutter/material.dart';

import '../../../../core/helpers/extensions.dart';

class TodayDetails extends StatelessWidget {
  final int queueCount;
  const TodayDetails({super.key, required this.queueCount});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        // Date
        Column(
          crossAxisAlignment: .start,
          children: [
            Text(
              context.dateFormater(DateTime.now()),
              style: context.themeData.textTheme.bodyLarge,
            ),
            Text(
              context.locale.onChairNow,
              style: TextStyle(
                color: context.themeData.colorScheme.primary,
                fontSize: 30,
                fontWeight: .bold,
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: .start,
          children: [
            Text(context.locale.remaining),
            Text(
              queueCount.toString(),
              style: TextStyle(
                color: context.themeData.colorScheme.primary,
                fontSize: 24,
                fontWeight: .bold,
              ),
            ),
          ],
        ),
        // Remaining customers
      ],
    );
  }
}
