import '../../../core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/app_preferences.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text(context.locale.settings)),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.h),
        child: Column(children: [const AppPreferences()]),
      ),
    );
  }
}
