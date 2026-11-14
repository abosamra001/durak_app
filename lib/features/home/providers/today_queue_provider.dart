import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/database/app_database.dart';
import '../../../core/helpers/business_date.dart';
import '../../../core/providers/queue_repository_provider.dart';

final todayQueueProvider = StreamProvider<List<Appointment>>((ref) {
  final dueDate = dateKey(currentBusinessDate(DateTime.now()));
  return ref.watch(queueRepositoryProvider).watchDay(dueDate);
});

final todayWaitingListProvider = Provider<AsyncValue<List<Appointment>>>(
  (ref) => ref
      .watch(todayQueueProvider)
      .whenData((list) => list.where((a) => a.status == .waiting).toList()),
);
