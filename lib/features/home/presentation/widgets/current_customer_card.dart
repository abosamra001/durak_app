import 'package:durak_app/core/database/app_database.dart';
import 'package:durak_app/core/helpers/extensions.dart';
import 'package:durak_app/core/helpers/spacer.dart';
import 'package:durak_app/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CurrentCustomerCard extends StatelessWidget {
  final Appointment appointment;
  final int queueCount;
  final VoidCallback onDonePressed;

  const CurrentCustomerCard({
    super.key,
    required this.appointment,
    required this.onDonePressed,
    required this.queueCount,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Date and remaining customers
        Row(
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
        ),

        verticalSpace(32),

        // Current customer card
        Container(
          padding: EdgeInsets.all(24.r),
          decoration: BoxDecoration(
            border: Border(
              right: BorderSide(
                color: context.themeData.primaryColor,
                width: 4,
              ),
            ),
            color: context.themeData.cardColor,
          ),
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
                    decoration: BoxDecoration(
                      color: context.themeData.scaffoldBackgroundColor,
                    ),
                    child: Text(
                      '#01',
                      style: TextStyle(
                        color: context.themeData.colorScheme.primary,
                        fontWeight: .bold,
                      ),
                    ),
                  ),
                ],
              ),
              verticalSpace(32),
              CustomButton(
                onPressed: onDonePressed,
                backgroundColor: context.themeData.colorScheme.primary,
                child: Row(
                  mainAxisAlignment: .center,
                  children: [
                    Icon(
                      Icons.done,
                      color: context.themeData.scaffoldBackgroundColor,
                    ),
                    horizontalSpace(8),
                    Text(
                      context.locale.done,
                      style: TextStyle(
                        color: context.themeData.scaffoldBackgroundColor,
                        fontWeight: .bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
