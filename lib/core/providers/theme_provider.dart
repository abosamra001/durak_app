import 'package:durak_app/core/helpers/constants.dart';
import 'package:durak_app/core/helpers/shared_preferences_helper.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_provider.g.dart';

@riverpod
class AppTheme extends _$AppTheme {
  @override
  ThemeMode build() => getThemeMode();

  void setTheme(ThemeMode mode) {
    state = mode;
    SharedPreferencesHelper.setString(ConstantsKeys.themeKey, mode.name);
  }

  void toggleTheme() {
    state == ThemeMode.dark
        ? setTheme(ThemeMode.light)
        : setTheme(ThemeMode.dark);
  }

  ThemeMode getThemeMode() {
    final currentMode = SharedPreferencesHelper.getStrig(
      ConstantsKeys.themeKey,
    );

    if (currentMode == ThemeMode.light.name) {
      return ThemeMode.light;
    } else if (currentMode == ThemeMode.dark.name) {
      return ThemeMode.dark;
    } else {
      return ThemeMode.system;
    }
  }
}
