import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/spacer.dart';
import '../../../../core/providers/locale_provider.dart';

class AppPreferenceLocale extends ConsumerWidget {
  const AppPreferenceLocale({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(appLocaleProvider);
    String dropDownValue = localeToString(context, locale);
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
            DropdownMenuItem<String>(value: 'عربي', child: Text('عربي')),
            DropdownMenuItem<String>(value: 'English', child: Text('English')),
          ],
          onChanged: (v) {
            ref
                .read(appLocaleProvider.notifier)
                .setLocale(stringToLocale(context, v!));
          },
        ),
      ],
    );
  }

  String localeToString(BuildContext context, Locale locale) {
    if (locale.languageCode == 'ar') {
      return 'عربي';
    } else {
      return 'English';
    }
  }

  Locale stringToLocale(BuildContext context, String str) {
    if (str == 'English') {
      return Locale('en');
    } else {
      return Locale('ar');
    }
  }
}
