import 'package:durak_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

extension LocalizationExtension on BuildContext {
  AppLocalizations get locale => AppLocalizations.of(this);
}

extension ThemeExtension on BuildContext {
  ThemeData get themeData => Theme.of(this);
}

extension NavigationExtension on BuildContext {
  void pop() => Navigator.of(this).pop();
}
