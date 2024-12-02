import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static SharedPreferences? sharedPreferences;
  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool?> setData(
      {required String key, required String value}) async {
    return await sharedPreferences?.setString(key, value);
  }

  static dynamic getData(String key) {
    return sharedPreferences?.get(key);
  }

  static Future<bool?> removeData(String key) async {
    return await sharedPreferences?.remove(key);
  }

  static void clearData() {
    sharedPreferences?.clear();
  }
}
