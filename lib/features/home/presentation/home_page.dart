import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helpers/extensions.dart';
import '../../../core/helpers/spacer.dart';
import '../../../core/providers/queue_controller.dart';
import '../../../core/themes/app_colors.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/app_drawer.dart';
import '../providers/today_queue_provider.dart';
import 'widgets/add_new_cutomer_dialog.dart';
import 'widgets/today_details.dart';
import 'widgets/customer_card.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appointmentsForToday = ref.watch(todayWaitingListProvider);
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
                            TodayDetails(queueCount: appointments.length),
                            verticalSpace(16),
                            CustomerCard(
                              appointment: appointments.first,
                              queueIndex: 1,
                              cardDecortion: BoxDecoration(
                                border: Border(
                                  right: BorderSide(
                                    color: context.themeData.primaryColor,
                                    width: 4,
                                  ),
                                ),
                                color: context.themeData.cardColor,
                              ),
                              queueIndexDecoration: BoxDecoration(
                                color:
                                    context.themeData.scaffoldBackgroundColor,
                              ),
                              actions: [
                                CustomButton(
                                  onPressed: () {
                                    ref
                                        .read(queueControllerProvider.notifier)
                                        .changeStatus(
                                          appointments.first.id,
                                          .done,
                                        );
                                  },
                                  backgroundColor:
                                      context.themeData.colorScheme.primary,
                                  child: Row(
                                    mainAxisAlignment: .center,
                                    children: [
                                      Icon(
                                        Icons.done,
                                        color: context
                                            .themeData
                                            .scaffoldBackgroundColor,
                                      ),
                                      horizontalSpace(8),
                                      Text(
                                        context.locale.done,
                                        style: TextStyle(
                                          color: context
                                              .themeData
                                              .scaffoldBackgroundColor,
                                          fontWeight: .bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
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
                        itemBuilder: (context, i) => CustomerCard(
                          appointment: waitingList[i],
                          queueIndex: i + 2,
                          actions: [
                            CustomButton(
                              onPressed: () {},
                              child: Icon(Icons.call),
                            ),
                            // horizontalSpace(16),
                            CustomButton(
                              onPressed: () {},
                              child: Icon(Icons.message),
                            ),
                          ],
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
