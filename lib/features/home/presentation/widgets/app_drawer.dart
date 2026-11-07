import 'package:durak_app/core/helpers/extensions.dart';
import 'package:durak_app/core/helpers/spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// استيراد الـ Providers الخاصة بك للثيم أو اللغة إذا رغبت
// import '.../theme_provider.dart';

class AppDrawer extends ConsumerWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      backgroundColor: context.themeData.colorScheme.surface,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: context.themeData.colorScheme.primary,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/icons/hairstyle.png'),
                  backgroundColor: context.themeData.colorScheme.surface,
                ),
                verticalSpace(10),
                Text(
                  'أبو سمرة',
                  style: context.themeData.textTheme.titleMedium?.copyWith(
                    color: context.themeData.colorScheme.onPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'mohamed@example.com',
                  style: context.themeData.textTheme.bodySmall?.copyWith(
                    color: context.themeData.colorScheme.onPrimary.withOpacity(
                      0.8,
                    ),
                  ),
                ),
              ],
            ),
          ),

          ListTile(
            leading: Icon(
              Icons.home,
              color: context.themeData.colorScheme.primary,
            ),
            title: const Text('الرئيسية'),
            onTap: () {
              context.pop();
            },
          ),
          ListTile(
            leading: Icon(
              Icons.calendar_month,
              color: context.themeData.colorScheme.primary,
            ),
            title: const Text('الجدول'),
            onTap: () {
              context.pop();
            },
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: context.themeData.colorScheme.primary,
            ),
            title: const Text('الإعدادات'),
            onTap: () {
              context.pop();
            },
          ),
        ],
      ),
    );
  }
}
