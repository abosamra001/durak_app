import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

import 'tables/appointments.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [Appointments])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(driftDatabase(name: 'durak_db'));
  @override
  int get schemaVersion => 1;
}
