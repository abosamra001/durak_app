import 'package:shared_preferences/shared_preferences.dart';

import '../constants/constants_keys.dart';

class Profile {
  final String name;
  final String phoneNumber;
  final String shopName;

  const Profile({
    required this.name,
    required this.phoneNumber,
    required this.shopName,
  });
}

class ProfileRepository {
  final SharedPreferences prefs;
  const ProfileRepository({required this.prefs});

  bool hasProfile() =>
      (prefs.getString(ConstantsKeys.profileNameKey) ?? '').isNotEmpty;

  Future<void> saveProfile(Profile profile) async {
    await prefs.setString(ConstantsKeys.profilePhoneKey, profile.phoneNumber);
    await prefs.setString(ConstantsKeys.profileShopNameKey, profile.shopName);
    await prefs.setString(ConstantsKeys.profileNameKey, profile.name);
  }

  Profile getProfileDetails() {
    final name = prefs.getString(ConstantsKeys.profileNameKey);
    final phone = prefs.getString(ConstantsKeys.profilePhoneKey);
    final shopName = prefs.getString(ConstantsKeys.profileShopNameKey);

    return Profile(
      name: name ?? '',
      phoneNumber: phone ?? '',
      shopName: shopName ?? '',
    );
  }
}
