import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  const SharedPreferencesHelper._();

  static late SharedPreferences _prefs;

  static void init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static void setBool(String key, bool value) async {
    await _prefs.setBool(key, value);
  }

  static bool? getBool(String key) => _prefs.getBool(key);

  static void setString(String key, String value) async {
    await _prefs.setString(key, value);
  }

  static String? getStrig(String key) => _prefs.getString(key);
}
