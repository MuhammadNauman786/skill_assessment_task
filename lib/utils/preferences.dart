import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _prefs;

  static Future<SharedPreferences> initialize() async {
    _prefs = await SharedPreferences.getInstance();
    return _prefs;
  }

  static Future<bool> setString(PREFERENCES key, String value) async {
    return _prefs.setString(key.name, value);
  }
  static Future<bool> setInt(PREFERENCES key, int value) async {
    return _prefs.setInt(key.name, value);
  }

  static String? getString(PREFERENCES key) {
    return _prefs.getString(key.name);
  }
  static int? getInt(PREFERENCES key) {
    return _prefs.getInt(key.name);
  }

  static Future<bool> remove(PREFERENCES key) async {
    return _prefs.remove(key.name);
  }
}

enum PREFERENCES { locale, auth}
