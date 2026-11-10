import 'package:drift/drift.dart';

enum AppointmentStatus { waiting, done, cancelled }

class Appointments extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 30)();
  TextColumn get phoneNumber => text()();
  TextColumn get visitDate => text()();
  IntColumn get position => integer()();
  TextColumn get status => textEnum<AppointmentStatus>()();
  TextColumn get notes => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}
