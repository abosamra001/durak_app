import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/providers/shared_preferences_provider.dart';
import '../../../core/constants/constants_keys.dart';

part 'locale_provider.g.dart';

@riverpod
class AppLocale extends _$AppLocale {
  @override
  Locale build() => getCurrentLocale();

  void setLocale(Locale locale) {
    state = locale;
    ref
        .watch(sharedPreferencesProvider)
        .setString(ConstantsKeys.localeKey, locale.languageCode);
  }

  void toggleLocale() {
    if (state.languageCode == 'ar') {
      setLocale(const Locale('en'));
    } else {
      setLocale(const Locale('ar'));
    }
  }

  Locale getCurrentLocale() {
    final locale = ref
        .watch(sharedPreferencesProvider)
        .getString(ConstantsKeys.localeKey);
    if (locale == 'en') {
      return Locale('en');
    } else {
      return Locale('ar');
    }
  }
}
