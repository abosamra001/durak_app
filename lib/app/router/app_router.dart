import 'routes.dart';
import '../../features/calendar/presentation/calendar_page.dart';
import '../../features/home/presentation/home_page.dart';
import '../../features/settings/presentation/settings_page.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: Routes.homepage,
  routes: [
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
