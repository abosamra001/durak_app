import '../../l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension LocalizationExtension on BuildContext {
  AppLocalizations get locale => AppLocalizations.of(this);
}

extension ThemeExtension on BuildContext {
  ThemeData get themeData => Theme.of(this);
}

extension NavigationExtension on BuildContext {
  void pop() => Navigator.of(this).pop();
}

extension DateFormaterExtension on BuildContext {
  String get localeLangCode => Localizations.localeOf(this).languageCode;
  String dateFormater(DateTime date) =>
      DateFormat.MMMMEEEEd(localeLangCode).format(date);
}
