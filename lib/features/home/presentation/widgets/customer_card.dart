import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/database/app_database.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/spacer.dart';
import '../../../../core/providers/queue_controller.dart';
import '../../../../core/widgets/more_options_popup.dart';

enum CardActions { moveup, movedown, cancel }

class CustomerCard extends ConsumerWidget {
  final Appointment appointment;
  final int queueIndex;
  final BoxDecoration? queueIndexDecoration;
  final BoxDecoration? cardDecortion;
  final List<Widget> actions;

  const CustomerCard({
    super.key,
    required this.appointment,
    required this.queueIndex,
    required this.actions,
    this.queueIndexDecoration,
    this.cardDecortion,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MoreOptionsPopup<CardActions>(
      onSelected: (action) {
        final controller = ref.read(queueControllerProvider.notifier);
        switch (action) {
          case CardActions.moveup:
            controller.moveUp(appointment.id);
          case CardActions.movedown:
            controller.moveDown(appointment.id);
          case CardActions.cancel:
            controller.changeStatus(appointment.id, .canceled);
        }
      },
      options: [
        PopupOption(value: CardActions.moveup, label: context.locale.moveup),
        PopupOption(
          value: CardActions.movedown,
          label: context.locale.movedown,
        ),
        PopupOption(value: CardActions.cancel, label: context.locale.cancel),
      ],
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16.r),
            decoration:
                cardDecortion ??
                BoxDecoration(color: context.themeData.colorScheme.surface),
            child: Column(
              mainAxisAlignment: .start,
              children: [
                Row(
                  crossAxisAlignment: .start,
                  children: [
                    // Current number
                    Container(
                      padding: EdgeInsets.all(12.r),
                      decoration: queueIndexDecoration,
                      child: Text(
                        '#$queueIndex',
                        style: TextStyle(fontSize: 24.sp, fontWeight: .bold),
                      ),
                    ),
                    horizontalSpace(14),
                    // Customer name and phone number
                    Expanded(
                      child: Column(
                        crossAxisAlignment: .start,
                        children: [
                          Text(
                            appointment.name,
                            style: context.themeData.textTheme.bodyLarge!
                                .copyWith(fontSize: 24.sp),
                            overflow: .ellipsis,
                          ),
                          Text(appointment.phoneNumber),
                        ],
                      ),
                    ),
                  ],
                ),
                verticalSpace(32),
                Row(
                  children: actions
                      .map(
                        (action) => Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.w),
                            child: action,
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
          verticalSpace(16),
        ],
      ),
    );
  }
}
