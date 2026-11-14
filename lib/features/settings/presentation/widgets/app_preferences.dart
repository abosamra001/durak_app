import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/spacer.dart';
import 'app_preference_locale.dart';
import 'app_preference_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppPreferences extends StatelessWidget {
  const AppPreferences({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Text(context.locale.appprefs),
        verticalSpace(16),
        Container(
          padding: EdgeInsets.all(24.r),
          color: context.themeData.cardColor,
          child: Column(
            children: [
              AppPreferenceTheme(),
              Divider(
                thickness: 0.4,
                color: context.themeData.colorScheme.onSurface.withValues(
                  alpha: 0.4,
                ),
              ),
              AppPreferenceLocale(),
            ],
          ),
        ),
      ],
    );
  }
}
