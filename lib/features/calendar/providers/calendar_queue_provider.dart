import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/database/app_database.dart';
import '../../../core/providers/queue_repository_provider.dart';

final calendarQueueProvider = StreamProvider.autoDispose
    .family<List<Appointment>, String>((ref, day) {
      return ref.watch(queueRepositoryProvider).watchDay(day);
    });
