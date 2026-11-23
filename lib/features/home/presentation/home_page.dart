import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/helpers/extensions.dart';
import '../../../core/helpers/spacer.dart';
import '../../../core/providers/queue_controller.dart';
import '../../../core/themes/app_colors.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/snackbars.dart';
import '../../calendar/presentation/calendar_page.dart';
import '../../settings/presentation/settings_page.dart';
import '../providers/today_queue_provider.dart';
import 'widgets/add_new_cutomer_dialog.dart';
import 'widgets/today_details.dart';
import 'widgets/customer_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 1;
  final pages = [SettingsPage(), HomePageBody(), CalendarPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
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
          // TODO: remove this
          Consumer(
            builder: (context, ref, _) => IconButton(
              onPressed: () {
                // ref.read(appThemeProvider.notifier).toggleTheme();
              },
              icon: Icon(Icons.notifications),
            ),
          ),
        ],
        actionsPadding: EdgeInsets.all(8.r),
      ),
      body: pages[selectedIndex],
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(16, 0, 16, 12),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.20),
                  blurRadius: 20,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: .circular(24.r),
              child: NavigationBar(
                height: 70,
                elevation: 0,
                selectedIndex: selectedIndex,
                onDestinationSelected: (index) {
                  setState(() => selectedIndex = index);
                },
                labelBehavior: .onlyShowSelected,
                destinations: const [
                  NavigationDestination(
                    icon: Icon(Icons.settings_outlined),
                    selectedIcon: Icon(Icons.settings_rounded),
                    label: 'Settings',
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.home_outlined),
                    selectedIcon: Icon(Icons.home_rounded),
                    label: 'Home',
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.calendar_month_outlined),
                    selectedIcon: Icon(Icons.calendar_month_rounded),
                    label: 'Schedule',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),

      floatingActionButton: selectedIndex != 0
          ? Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
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
            )
          : SizedBox(),
      floatingActionButtonLocation: .endFloat,
    );
  }
}

class HomePageBody extends ConsumerWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appointmentsForToday = ref.watch(todayWaitingListProvider);
    return appointmentsForToday.when(
      loading: () => Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => Center(child: Text(error.toString())),
      data: (appointments) {
        final waitingList = appointments.skip(1).toList();
        return appointments.isEmpty
            ? Center(child: Text(context.locale.noappointmentsyet))
            : Padding(
                padding: .symmetric(horizontal: 16.w),
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Column(
                        crossAxisAlignment: .start,
                        children: [
                          verticalSpace(16),
                          TodayDetails(queueCount: appointments.length),
                          verticalSpace(16),
                          // Customer on chair
                          CustomerCard(
                            appointment: appointments.first,
                            queueIndex: 1,
                            cardDecortion: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              color: context.themeData.colorScheme.surface,
                            ),
                            queueIndexDecoration: BoxDecoration(
                              color: context.themeData.colorScheme.secondary,
                              borderRadius: .circular(12.r),
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
                            onPressed: () async {
                              final ok = await launchUrl(
                                Uri(
                                  scheme: 'tel',
                                  path: waitingList[i].phoneNumber,
                                ),
                              );

                              if (!ok && context.mounted) {
                                showErrorSnackBar(context);
                              }
                            },
                            child: Icon(Icons.call),
                          ),
                        ],
                      ),
                    ),
                    SliverToBoxAdapter(child: verticalSpace(80)),
                  ],
                ),
              );
      },
    );
  }
}
