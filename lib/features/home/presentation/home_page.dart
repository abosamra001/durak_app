import 'package:durak_app/core/helpers/extensions.dart';
import 'package:durak_app/core/helpers/spacer.dart';
import 'package:durak_app/core/themes/app_colors.dart';
import 'package:durak_app/features/home/presentation/widgets/add_new_cutomer_dialog.dart';
import 'package:durak_app/core/widgets/app_drawer.dart';
import 'package:durak_app/features/home/presentation/widgets/waiting_customer_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/current_customer_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
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
      drawer: const AppDrawer(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.h),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  verticalSpace(16),
                  CurrentCustomerCard(),
                  verticalSpace(32),
                  Text(
                    context.locale.waitingqueue,
                    style: context.themeData.textTheme.bodyLarge,
                  ),
                  verticalSpace(16),
                ],
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => WaitingCustomerCard(index: index + 2),
                childCount: 5,
              ),
            ),
          ],
        ),
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
