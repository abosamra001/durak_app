import 'package:durak_app/core/helpers/shared_preferences_helper.dart';
import 'package:durak_app/core/providers/locale_provider.dart';
import 'package:durak_app/core/providers/theme_provider.dart';
import 'package:durak_app/core/router/app_router.dart';
import 'package:durak_app/core/themes/theme_manager.dart';
import 'package:durak_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferencesHelper.init();
  runApp(ProviderScope(child: const DorakApp()));
}

class DorakApp extends ConsumerWidget {
  const DorakApp({super.key});

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

          routerConfig: appRouter,
        );
      },
    );
  }
}
