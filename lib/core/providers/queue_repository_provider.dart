import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/queue_repository.dart';
import 'app_database_provider.dart';

final queueRepositoryProvider = Provider<QueueRepository>(
  (ref) => QueueRepository(ref.watch(appDatabaseProvider)),
);
