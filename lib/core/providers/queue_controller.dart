import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constants/enums.dart';
import 'queue_repository_provider.dart';

class QueueController extends AsyncNotifier<void> {
  @override
  Future<void> build() async {}

  Future<void> addNew({
    required String name,
    required String phoneNumber,
    required String visitDate,
    String? notes,
  }) async {
    state = AsyncLoading();
    state = await AsyncValue.guard(
      () => ref
          .read(queueRepositoryProvider)
          .addAppointment(
            name: name,
            phoneNumber: phoneNumber,
            visitDate: visitDate,
            notes: notes,
          ),
    );
  }

  Future<void> changeStatus(int id, AppointmentStatus status) async {
    state = AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(queueRepositoryProvider).setStatus(id, status),
    );
  }

  Future<void> moveUp(int id) => _move(id, up: true);

  Future<void> moveDown(int id) => _move(id, up: false);

  Future<void> _move(int id, {required bool up}) async {
    state = AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(queueRepositoryProvider).move(id, up: up),
    );
  }
}

final queueControllerProvider = AsyncNotifierProvider<QueueController, void>(
  QueueController.new,
);
