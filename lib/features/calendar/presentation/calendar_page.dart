import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../core/constants/enums.dart';
import '../../../core/helpers/business_date.dart';
import '../../../core/helpers/extensions.dart';
import '../../../core/helpers/spacer.dart';
import '../../../core/providers/queue_controller.dart';
import '../../../core/widgets/more_options_popup.dart';
import '../providers/calendar_queue_provider.dart';
import 'widgets/calendar_customer_card.dart';
import 'widgets/calendar_status_filter.dart';

enum CalendarActions { markAsDone, markAsWaiting, markAsCanceld }

class CalendarPage extends ConsumerStatefulWidget {
  const CalendarPage({super.key});

  @override
  ConsumerState<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends ConsumerState<CalendarPage> {
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  CalendarFormat _calendarFormat = CalendarFormat.week;
  CalendarStatus _selectedStatus = .all;

  @override
  Widget build(BuildContext context) {
    final appointments = ref.watch(
      calendarQueueProvider(dateKey(_selectedDay)),
    );
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(12.r),
        child: Column(
          children: [
            TableCalendar(
              focusedDay: _focusedDay,
              firstDay: DateTime.utc(DateTime.now().year, 1, 1),
              lastDay: DateTime.utc(DateTime.now().year + 1, 1, 1),
              locale: context.localeLangCode,
              startingDayOfWeek: .saturday,
              weekendDays: [DateTime.monday],
              calendarFormat: _calendarFormat,
              onFormatChanged: (format) => setState(() {
                _calendarFormat = format;
              }),
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              },
              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
              calendarBuilders: CalendarBuilders(),
            ),
            CalendarStatusFilter(
              selectedStatus: _selectedStatus,
              onFilterStatusChanged: (status) {
                setState(() {
                  _selectedStatus = status;
                });
              },
            ),
            verticalSpace(16),
            appointments.when(
              loading: () => Center(child: CircularProgressIndicator()),
              error: (error, _) => Center(child: Text(error.toString())),
              data: (list) {
                final filteredList = list
                    .where((a) => compareStatus(a.status))
                    .toList();
                return filteredList.isEmpty
                    ? Center(child: Text(context.locale.noappointmentsyet))
                    : Expanded(
                        child: ListView.builder(
                          itemCount: filteredList.length,
                          itemBuilder: ((context, index) =>
                              MoreOptionsPopup<CalendarActions>(
                                onSelected: (action) async {
                                  final controller = ref.read(
                                    queueControllerProvider.notifier,
                                  );
                                  switch (action) {
                                    case CalendarActions.markAsDone:
                                      controller.changeStatus(
                                        filteredList[index].id,
                                        .done,
                                      );
                                    case CalendarActions.markAsWaiting:
                                      controller.changeStatus(
                                        filteredList[index].id,
                                        .waiting,
                                      );
                                    case CalendarActions.markAsCanceld:
                                      controller.changeStatus(
                                        filteredList[index].id,
                                        .canceled,
                                      );
                                  }
                                },
                                options: [
                                  PopupOption(
                                    value: CalendarActions.markAsDone,
                                    label: context.locale.markasdone,
                                  ),
                                  PopupOption(
                                    value: CalendarActions.markAsWaiting,
                                    label: context.locale.markaswaiting,
                                  ),
                                  PopupOption(
                                    value: CalendarActions.markAsCanceld,
                                    label: context.locale.markascanceled,
                                  ),
                                ],
                                child: CalendarCustomerCard(
                                  customerName: filteredList[index].name,
                                  customerPhone:
                                      filteredList[index].phoneNumber,
                                  index: index + 1,
                                  status: convert(filteredList[index].status),
                                ),
                              )),
                        ),
                      );
              },
            ),
          ],
        ),
      ),
    );
  }

  bool compareStatus(AppointmentStatus status) => switch (_selectedStatus) {
    CalendarStatus.all => true,
    CalendarStatus.waiting => status == .waiting,
    CalendarStatus.done => status == .done,
    CalendarStatus.canceled => status == .canceled,
  };

  CalendarStatus convert(AppointmentStatus status) => switch (status) {
    AppointmentStatus.waiting => .waiting,
    AppointmentStatus.done => .done,
    AppointmentStatus.canceled => .canceled,
  };
}
