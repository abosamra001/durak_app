import 'package:durak_app/app/router/routes.dart';
import 'package:durak_app/features/calender/presentation/calender_page.dart';
import 'package:durak_app/features/home/presentation/home_page.dart';
import 'package:durak_app/features/settings/presentation/settings_page.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: Routes.homepage, // TODO - REPLACE THIS
  routes: [
    GoRoute(path: Routes.homepage, builder: (context, state) => HomePage()),
    GoRoute(
      path: Routes.calenderpage,
      builder: (context, state) => CalenderPage(),
    ),
    GoRoute(
      path: Routes.settingspage,
      builder: (context, state) => SettingsPage(),
    ),
  ],
);
