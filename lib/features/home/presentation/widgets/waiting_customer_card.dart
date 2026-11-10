import 'package:durak_app/core/database/app_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/spacer.dart';
import '../../../../core/widgets/custom_button.dart';

class WaitingCustomerCard extends StatelessWidget {
  final Appointment appointment;
  final int queueIndex;
  const WaitingCustomerCard({
    super.key,
    required this.appointment,
    required this.queueIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(16.r),
          color: context.themeData.colorScheme.surface,
          child: Column(
            mainAxisAlignment: .start,
            children: [
              Row(
                mainAxisAlignment: .spaceBetween,
                crossAxisAlignment: .start,
                children: [
                  // Customer name and phone number
                  Column(
                    crossAxisAlignment: .start,
                    children: [
                      Text(
                        appointment.name,
                        style: context.themeData.textTheme.bodyLarge!.copyWith(
                          fontSize: 24.sp,
                        ),
                      ),
                      Text(appointment.phoneNumber),
                    ],
                  ),
                  // Current number
                  Container(
                    padding: EdgeInsets.all(12.r),
                    child: Text(
                      '#$queueIndex',
                      style: TextStyle(
                        color: context.themeData.colorScheme.onSurface
                            .withAlpha(155),
                        fontSize: 24.sp,
                        fontWeight: .bold,
                      ),
                    ),
                  ),
                ],
              ),
              verticalSpace(32),
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  CustomButton(onPressed: () {}, child: Icon(Icons.call)),
                  CustomButton(onPressed: () {}, child: Icon(Icons.message)),
                  CustomButton(
                    onPressed: () {},
                    child: Icon(Icons.switch_left_rounded),
                  ),
                ],
              ),
            ],
          ),
        ),
        verticalSpace(16),
      ],
    );
  }
}
