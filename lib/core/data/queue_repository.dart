import 'package:drift/drift.dart';
import 'package:durak_app/core/database/app_database.dart';
import 'package:durak_app/core/database/tables/appointments.dart';

class QueueRepository {
  final AppDatabase _db;
  const QueueRepository(this._db);

  Stream<List<Appointment>> watchQueue(String dueDate) {
    return (_db.select(_db.appointments)
          ..where(
            (a) => a.visitDate.equals(dueDate) & a.status.equalsValue(.waiting),
          )
          ..orderBy([
            (a) => OrderingTerm.asc(a.position),
            (a) => OrderingTerm.asc(a.id),
          ]))
        .watch();
  }

  Future<void> setStatus(int id, AppointmentStatus newStatus) async {
    await (_db.update(_db.appointments)..where((a) => a.id.equals(id))).write(
      AppointmentsCompanion(status: Value(newStatus)),
    );
  }

  Future<void> addAppointment({
    required String name,
    required String phoneNumber,
    required String visitDate,
    String? notes,
  }) async {
    return _db.transaction(() async {
      final last =
          await (_db.select(_db.appointments)
                ..where((a) => a.visitDate.equals(visitDate))
                ..orderBy([(a) => OrderingTerm.desc(a.position)])
                ..limit(1))
              .getSingleOrNull();

      await (_db
          .into(_db.appointments)
          .insert(
            AppointmentsCompanion.insert(
              name: name,
              phoneNumber: phoneNumber,
              visitDate: visitDate,
              position: last == null ? 1 : last.position + 1,
              status: .waiting,
              notes: Value(notes),
            ),
          ));
    });
  }
}
