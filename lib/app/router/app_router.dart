import '../../features/onboarding/presentation/onboarding_page.dart';
import 'routes.dart';
import '../../features/calendar/presentation/calendar_page.dart';
import '../../features/home/presentation/home_page.dart';
import '../../features/settings/presentation/settings_page.dart';
import 'package:go_router/go_router.dart';

GoRouter createRouter({required String initialLocation}) {
  return GoRouter(
    initialLocation: initialLocation,
    routes: [
      GoRoute(
        path: Routes.onboarding,
        builder: (context, state) => OnboardingPage(),
      ),
      GoRoute(path: Routes.homepage, builder: (context, state) => HomePage()),
      GoRoute(
        path: Routes.calendarpage,
        builder: (context, state) => CalendarPage(),
      ),
      GoRoute(
        path: Routes.settingspage,
        builder: (context, state) => SettingsPage(),
      ),
    ],
  );
}
