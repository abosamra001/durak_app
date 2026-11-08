import 'package:durak_app/core/helpers/extensions.dart';
import 'package:durak_app/core/helpers/spacer.dart';
import 'package:durak_app/core/providers/theme_provider.dart';
import 'package:durak_app/features/settings/presentation/widgets/app_preference_locale.dart';
import 'package:durak_app/features/settings/presentation/widgets/app_preference_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
