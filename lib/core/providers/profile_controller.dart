import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/profile_repository.dart';
import 'profile_repository_provider.dart';

part 'profile_controller.g.dart';

@Riverpod(keepAlive: true)
class ProfileController extends _$ProfileController {
  @override
  FutureOr<void> build() {}

  Future<void> saveProfile(Profile profile) async {
    state = AsyncLoading();
    state = await AsyncValue.guard(() async {
      await ref.read(profileRepositoryProvider).saveProfile(profile);
    });
    if (!state.hasError) ref.invalidate(profileProvider);
  }
}
