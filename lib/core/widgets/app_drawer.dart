import 'package:flutter/material.dart';

import '../../app/router/app_router.dart';
import '../../app/router/routes.dart';
import '../helpers/extensions.dart';
import '../helpers/spacer.dart';

class AppDrawer extends StatelessWidget {
  final String name;
  const AppDrawer({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
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
                  name,
                  style: context.themeData.textTheme.titleMedium?.copyWith(
                    color: context.themeData.colorScheme.onPrimary,
                    fontWeight: FontWeight.bold,
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
            title: Text(context.locale.home),
            onTap: () {
              context.pop();
              appRouter.go(Routes.homepage);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.calendar_month,
              color: context.themeData.colorScheme.primary,
            ),
            title: Text(context.locale.calender),
            onTap: () {
              context.pop();
              appRouter.push(Routes.calenderpage);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: context.themeData.colorScheme.primary,
            ),
            title: Text(context.locale.settings),
            onTap: () {
              context.pop();
              appRouter.push(Routes.settingspage);
            },
          ),
        ],
      ),
    );
  }
}
