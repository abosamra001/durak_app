import 'package:durak_app/core/helpers/extensions.dart';
import 'package:durak_app/core/helpers/spacer.dart';
import 'package:durak_app/core/themes/app_colors.dart';
import 'package:durak_app/features/home/presentation/widgets/add_new_cutomer_dialog.dart';
import 'package:durak_app/core/widgets/app_drawer.dart';
import 'package:durak_app/features/home/presentation/widgets/waiting_customer_card.dart';
import 'package:durak_app/features/home/providers/today_queue_provider.dart';
import 'package:durak_app/core/providers/queue_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/current_customer_card.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appointmentsForToday = ref.watch(todayQueueProvider);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          crossAxisAlignment: .end,
          children: [
            Text(
              context.locale.appname,
              style: context.themeData.textTheme.bodyLarge!.copyWith(
                fontSize: 20.sp,
                color: AppColors.primaryAmber,
              ),
            ),
            horizontalSpace(8),
            Text(
              context.locale.appdiscription,
              style: context.themeData.textTheme.bodySmall,
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
        ],
        actionsPadding: EdgeInsets.all(8.r),
      ),
      drawer: const AppDrawer(name: 'Mohamed Gamal'),
      body: appointmentsForToday.when(
        loading: () => Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text(error.toString())),
        data: (appointments) {
          final waitingList = appointments.skip(1).toList();
          return appointments.isEmpty
              ? Center(child: Text(context.locale.noappointmentsyet))
              : Padding(
                  padding: .all(16.r),
                  child: CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: Column(
                          crossAxisAlignment: .start,
                          children: [
                            verticalSpace(16),
                            CurrentCustomerCard(
                              appointment: appointments.first,
                              queueCount: appointments.length,
                              onDonePressed: () {
                                ref
                                    .read(queueControllerProvider.notifier)
                                    .marakAsCompleted(appointments.first.id);
                              },
                            ),
                            verticalSpace(32),
                            Text(
                              context.locale.waitingqueue,
                              style: context.themeData.textTheme.bodyLarge,
                            ),
                            verticalSpace(16),
                          ],
                        ),
                      ),
                      SliverList.builder(
                        itemCount: waitingList.length,
                        itemBuilder: (context, index) => WaitingCustomerCard(
                          appointment: waitingList[index],
                          queueIndex: index + 2,
                        ),
                      ),
                    ],
                  ),
                );
        },
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        child: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => AddNewCutomerDialog(),
            );
          },
          child: Icon(Icons.add),
        ),
      ),
      floatingActionButtonLocation: .endFloat,
    );
  }
}
