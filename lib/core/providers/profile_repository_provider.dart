import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/profile_repository.dart';
import 'shared_preferences_provider.dart';

final profileRepositoryProvider = Provider<ProfileRepository>(
  (ref) => ProfileRepository(prefs: ref.watch(sharedPreferencesProvider)),
);

final profileProvider = Provider<Profile>(
  (ref) => ref.watch(profileRepositoryProvider).getProfileDetails(),
);
