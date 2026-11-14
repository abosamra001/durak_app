import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/enums.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/spacer.dart';

class CalendarCustomerCard extends StatelessWidget {
  final String customerName;
  final String customerPhone;
  final int index;
  final CalendarStatus status;
  const CalendarCustomerCard({
    super.key,
    required this.customerName,
    required this.customerPhone,
    required this.index,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.r),
      margin: EdgeInsets.only(bottom: 12.h),
      decoration: BoxDecoration(
        color: context.themeData.colorScheme.surface,
        border: BorderDirectional(
          start: BorderSide(color: status.color, width: 8),
        ),
      ),
      child: Row(
        crossAxisAlignment: .start,
        children: [
          // Current number
          Container(
            padding: EdgeInsets.all(12.r),
            child: Text(
              '#$index',
              style: TextStyle(
                color: context.themeData.colorScheme.onSurface.withAlpha(155),
                fontSize: 24.sp,
                fontWeight: .bold,
              ),
            ),
          ),
          horizontalSpace(14),
          // Customer name and phone number
          Column(
            crossAxisAlignment: .start,
            children: [
              Text(
                customerName,
                style: context.themeData.textTheme.bodyLarge!.copyWith(
                  fontSize: 24.sp,
                ),
              ),
              Text(customerPhone),
            ],
          ),
        ],
      ),
    );
  }
}
