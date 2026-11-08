import 'package:durak_app/core/helpers/constants.dart';
import 'package:durak_app/core/helpers/shared_preferences_helper.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'locale_provider.g.dart';

@riverpod
class AppLocale extends _$AppLocale {
  @override
  Locale build() => getCurrentLocale();

  void setLocale(Locale locale) {
    state = locale;
    SharedPreferencesHelper.setString(
      ConstantsKeys.localeKey,
      locale.languageCode,
    );
  }

  void toggleLocale() {
    if (state.languageCode == 'ar') {
      setLocale(const Locale('en'));
    } else {
      setLocale(const Locale('ar'));
    }
  }

  Locale getCurrentLocale() {
    final locale = SharedPreferencesHelper.getStrig(ConstantsKeys.localeKey);
    if (locale == 'en') {
      return Locale('en');
    } else {
      return Locale('ar');
    }
  }
}
