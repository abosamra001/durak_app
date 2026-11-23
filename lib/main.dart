import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/router/app_router.dart';
import 'app/router/routes.dart';
import 'core/data/profile_repository.dart';
import 'core/providers/shared_preferences_provider.dart';
import 'app/durak_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefsInstance = await SharedPreferences.getInstance();

  final appRouter = createRouter(
    // initialLocation: Routes.onboarding,
    initialLocation: ProfileRepository(prefs: prefsInstance).hasProfile()
        ? Routes.homepage
        : Routes.onboarding,
  );
  runApp(
    ProviderScope(
      overrides: [sharedPreferencesProvider.overrideWithValue(prefsInstance)],
      child: DurakApp(router: appRouter),
    ),
  );
}
