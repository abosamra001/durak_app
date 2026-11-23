import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../core/themes/theme_manager.dart';
import '../core/providers/locale_provider.dart';
import '../core/providers/theme_provider.dart';
import '../l10n/app_localizations.dart';

class DurakApp extends ConsumerWidget {
  final GoRouter router;
  const DurakApp({super.key, required this.router});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(appLocaleProvider);
    final themeMode = ref.watch(appThemeProvider);
    return ScreenUtilInit(
      designSize: const Size(390, 884),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp.router(
          title: 'Durak',
          debugShowCheckedModeBanner: false,
          // Theming
          themeMode: themeMode,
          theme: ThemeManager.lightTheme,
          darkTheme: ThemeManager.darkTheme,
          // Localization
          locale: locale,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,

          routerConfig: router,
        );
      },
    );
  }
}
