import 'package:drift/drift.dart';
import '../constants/enums.dart';
import '../database/app_database.dart';

class QueueRepository {
  final AppDatabase _db;
  const QueueRepository(this._db);

  Stream<List<Appointment>> watchDay(String visitDate) {
    return (_db.select(_db.appointments)
          ..where((a) => a.visitDate.equals(visitDate))
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
              status: AppointmentStatus.waiting,
              notes: Value(notes),
            ),
          ));
    });
  }

  Future<void> move(int id, {required bool up}) async {
    return (_db.transaction(() async {
      final current = await (_db.select(
        _db.appointments,
      )..where((a) => a.id.equals(id))).getSingleOrNull();

      if (current == null) return;
      print(
        '================================= current ${current.name},${current.id},${current.position},',
      );
      final neighbor =
          await (_db.select(_db.appointments)
                ..where(
                  (a) =>
                      a.visitDate.equals(current.visitDate) &
                      a.status.equalsValue(.waiting) &
                      (up
                          ? a.position.isSmallerThanValue(current.position)
                          : a.position.isBiggerThanValue(current.position)),
                )
                ..orderBy([
                  (a) => OrderingTerm(
                    expression: a.position,
                    mode: up ? .desc : .asc,
                  ),
                ])
                ..limit(1))
              .getSingleOrNull();

      if (neighbor == null) return;
      print(
        '================================= neighbor ${neighbor.name},${neighbor.id},${neighbor.position},',
      );

      await (_db.update(_db.appointments)
            ..where((a) => a.id.equals(current.id)))
          .write(AppointmentsCompanion(position: Value(neighbor.position)));
      await (_db.update(_db.appointments)
            ..where((a) => a.id.equals(neighbor.id)))
          .write(AppointmentsCompanion(position: Value(current.position)));
    }));
  }
}
