import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/database/app_database.dart';
import '../../../core/helpers/extensions.dart';
import '../../../core/providers/business_date_provider.dart';
import '../../../core/providers/queue_repository_provider.dart';

final todayQueueProvider = StreamProvider<List<Appointment>>((ref) {
  final businessDate = ref.watch(businessDateProvider);
  return ref.watch(queueRepositoryProvider).watchDay(businessDate.parseDate);
});

final todayWaitingListProvider = Provider<AsyncValue<List<Appointment>>>(
  (ref) => ref
      .watch(todayQueueProvider)
      .whenData((list) => list.where((a) => a.status == .waiting).toList()),
);
