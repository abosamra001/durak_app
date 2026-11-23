import '../../../core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helpers/spacer.dart';
import '../../../core/providers/business_date_provider.dart';
import 'widgets/app_preference_locale.dart';
import 'widgets/app_preference_theme.dart';
import 'widgets/personal_informations.dart';
import 'widgets/settings_card.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.h),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: .start,
          children: [
            PersonalInformations(),
            verticalSpace(24),
            SettingsCard(
              items: [
                IconButton(
                  onPressed: () async {
                    final pickedTime = await showTimePicker(
                      context: context,
                      initialTime: .now(),
                    );
                    if (pickedTime == null) return;
                    ref
                        .read(businessDateProvider.notifier)
                        .setBusinessDate(pickedTime.hour);
                  },
                  icon: Icon(Icons.timer),
                ),
              ],
              cardLabel: 'Business Date',
            ),
            verticalSpace(24),
            SettingsCard(
              cardLabel: context.locale.appprefs,
              items: [AppPreferenceTheme(), Divider(), AppPreferenceLocale()],
            ),
          ],
        ),
      ),
    );
  }
}
