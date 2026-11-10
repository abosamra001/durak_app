import 'package:durak_app/core/providers/queue_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

  Future<void> marakAsCompleted(int id) async {
    state = AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(queueRepositoryProvider).setStatus(id, .done),
    );
  }

  Future<void> markAsCanceled(int id) async {
    state = AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(queueRepositoryProvider).setStatus(id, .cancelled),
    );
  }
}

final queueControllerProvider = AsyncNotifierProvider<QueueController, void>(
  QueueController.new,
);
