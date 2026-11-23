import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../constants/constants_keys.dart';
import 'shared_preferences_provider.dart';

part 'business_date_provider.g.dart';

@riverpod
class BusinessDate extends _$BusinessDate {
  @override
  DateTime build() => currentBusinessDate(DateTime.now());

  DateTime currentBusinessDate(DateTime date) {
    final startHour =
        ref
            .read(sharedPreferencesProvider)
            .getInt(ConstantsKeys.businessDateKey) ??
        12;
    print(
      "from currentBusinessDate ======================================================= $startHour",
    );
    return date.hour < startHour
        ? DateTime(date.year, date.month, date.day - 1)
        : DateTime(date.year, date.month, date.day);
  }

  Future<void> setBusinessDate(int startHour) async {
    await ref
        .read(sharedPreferencesProvider)
        .setInt(ConstantsKeys.businessDateKey, startHour);
    ref.invalidateSelf();
    print(
      "from setBusinessDate ======================================================= is done",
    );
  }
}
