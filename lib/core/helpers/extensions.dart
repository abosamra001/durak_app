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

extension BusinessDateExtension on DateTime {
  String formate(BuildContext context) {
    String localeLangCode = Localizations.localeOf(context).languageCode;
    return DateFormat.MMMMEEEEd(localeLangCode).format(this);
  }

  String get parseDate =>
      '${year.toString().padLeft(4, '0')}-'
      '${month.toString().padLeft(2, '0')}-'
      '${day.toString().padLeft(2, '0')}';
}
