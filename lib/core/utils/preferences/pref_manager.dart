import 'package:shared_preferences/shared_preferences.dart';

import 'pref_manager_constants.dart';

class PrefManager {
  static SharedPreferences? prefs;

  static Future setupSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
  }

  static void clearSharedPreferences() async {
    await prefs?.clear();
  }

  static void setString(String data, String key) async {
    await prefs?.setString(key, data);
  }

  static String getStringWithKey(String key) {
    return prefs?.getString(key) ?? '';
  }

  static void setToken(String token) {
    prefs?.setString(PrefManagerConstants.tokenKey, token);
  }

  static String? getToken() {
    return prefs?.getString(PrefManagerConstants.tokenKey);
  }
}
