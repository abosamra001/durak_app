import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @appname.
  ///
  /// In en, this message translates to:
  /// **'Dorak'**
  String get appname;

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome'**
  String get welcome;

  /// No description provided for @onChairNow.
  ///
  /// In en, this message translates to:
  /// **'On the Chair now'**
  String get onChairNow;

  /// No description provided for @remaining.
  ///
  /// In en, this message translates to:
  /// **'Remaining'**
  String get remaining;

  /// No description provided for @addnewcustomer.
  ///
  /// In en, this message translates to:
  /// **'Add New Customer'**
  String get addnewcustomer;

  /// No description provided for @appdiscription.
  ///
  /// In en, this message translates to:
  /// **'Manage your Customers easly'**
  String get appdiscription;

  /// No description provided for @done.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get done;

  /// No description provided for @waitingqueue.
  ///
  /// In en, this message translates to:
  /// **'Waiting queue'**
  String get waitingqueue;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @calender.
  ///
  /// In en, this message translates to:
  /// **'Calender'**
  String get calender;

  /// No description provided for @namelabel.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get namelabel;

  /// No description provided for @namehint.
  ///
  /// In en, this message translates to:
  /// **'Enter a name'**
  String get namehint;

  /// No description provided for @addfromcontacts.
  ///
  /// In en, this message translates to:
  /// **'Add from contacts'**
  String get addfromcontacts;

  /// No description provided for @addmanually.
  ///
  /// In en, this message translates to:
  /// **'Add manually'**
  String get addmanually;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// No description provided for @phonenumberlabel.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phonenumberlabel;

  /// No description provided for @phonenumberhint.
  ///
  /// In en, this message translates to:
  /// **'Add a phone number'**
  String get phonenumberhint;

  /// No description provided for @noteslabel.
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get noteslabel;

  /// No description provided for @noteshint.
  ///
  /// In en, this message translates to:
  /// **'Add notes'**
  String get noteshint;

  /// No description provided for @datelabel.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get datelabel;

  /// No description provided for @datehint.
  ///
  /// In en, this message translates to:
  /// **'Pick a date'**
  String get datehint;

  /// No description provided for @requiredfield.
  ///
  /// In en, this message translates to:
  /// **'This field is required'**
  String get requiredfield;

  /// No description provided for @appprefs.
  ///
  /// In en, this message translates to:
  /// **'App Preferences'**
  String get appprefs;

  /// No description provided for @apptheme.
  ///
  /// In en, this message translates to:
  /// **'App Theme'**
  String get apptheme;

  /// No description provided for @applocale.
  ///
  /// In en, this message translates to:
  /// **'App language'**
  String get applocale;

  /// No description provided for @appthemesystem.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get appthemesystem;

  /// No description provided for @appthemedark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get appthemedark;

  /// No description provided for @appthemelight.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get appthemelight;

  /// No description provided for @somethingWentWrong.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get somethingWentWrong;

  /// No description provided for @noappointmentsyet.
  ///
  /// In en, this message translates to:
  /// **'No appointments available today.'**
  String get noappointmentsyet;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
