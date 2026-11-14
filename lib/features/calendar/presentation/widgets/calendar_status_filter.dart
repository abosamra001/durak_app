import 'package:flutter/material.dart';

import '../../../../core/constants/enums.dart';
import '../../../../core/helpers/extensions.dart';

class CalendarStatusFilter extends StatelessWidget {
  final CalendarStatus selectedStatus;
  final ValueChanged<CalendarStatus> onFilterStatusChanged;
  const CalendarStatusFilter({
    super.key,
    required this.selectedStatus,
    required this.onFilterStatusChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      children: CalendarStatus.values.map((status) {
        final isSelected = selectedStatus == status;
        return ChoiceChip(
          label: Text(getLocaleStatus(context, status)),
          selected: isSelected,
          selectedColor: status.color,
          onSelected: (value) => onFilterStatusChanged(status),
        );
      }).toList(),
    );
  }
}

String getLocaleStatus(BuildContext context, CalendarStatus status) {
  return switch (status) {
    CalendarStatus.all => context.locale.filterall,
    CalendarStatus.waiting => context.locale.filterwaiting,
    CalendarStatus.done => context.locale.filterdone,
    CalendarStatus.canceled => context.locale.filtercanceled,
  };
}
