import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/spacer.dart';
import '../../providers/theme_provider.dart';

class AppPreferenceTheme extends ConsumerWidget {
  const AppPreferenceTheme({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    String dropDownValue = getLocaleName(context, theme);
    return Row(
      children: [
        Icon(Icons.dark_mode_outlined),
        horizontalSpace(12),
        Text(
          context.locale.apptheme,
          style: context.themeData.textTheme.bodyLarge,
        ),
        Spacer(),
        DropdownButton<String>(
          value: dropDownValue,
          items: [
            DropdownMenuItem<String>(
              value: context.locale.appthemesystem,
              child: Text(context.locale.appthemesystem),
            ),
            DropdownMenuItem<String>(
              value: context.locale.appthemelight,
              child: Text(context.locale.appthemelight),
            ),
            DropdownMenuItem<String>(
              value: context.locale.appthemedark,
              child: Text(context.locale.appthemedark),
            ),
          ],
          onChanged: (v) {
            ref
                .read(appThemeProvider.notifier)
                .setTheme(getThemeMode(context, v!));
          },
        ),
      ],
    );
  }

  String getLocaleName(BuildContext context, ThemeMode theme) {
    return switch (theme) {
      ThemeMode.system => context.locale.appthemesystem,
      ThemeMode.light => context.locale.appthemelight,
      ThemeMode.dark => context.locale.appthemedark,
    };
  }

  ThemeMode getThemeMode(BuildContext context, String str) {
    if (str == context.locale.appthemesystem) {
      return ThemeMode.system;
    }
    if (str == context.locale.appthemedark) {
      return ThemeMode.dark;
    }
    if (str == context.locale.appthemelight) {
      return ThemeMode.light;
    } else {
      return ThemeMode.system;
    }
  }
}
