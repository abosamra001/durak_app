import 'package:shared_preferences/shared_preferences.dart';

class BusinessDateRepository {
  final SharedPreferences prefs;
  const BusinessDateRepository(this.prefs);
}
