import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/spacer.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsCard extends StatelessWidget {
  final String cardLabel;
  final List<Widget> items;
  const SettingsCard({super.key, required this.items, required this.cardLabel});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Text(cardLabel),
        verticalSpace(16),
        Container(
          padding: EdgeInsets.all(24.r),
          color: context.themeData.cardColor,
          child: Column(children: items),
        ),
      ],
    );
  }
}
