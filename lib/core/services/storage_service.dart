import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  final SharedPreferences prefs;
  StorageService({
    required this.prefs,
  });

  Future<bool> setString(String key, String value) async {
    return await prefs.setString(key, value);
  }

  Future<bool> setBool(String key, bool value) async {
    return await prefs.setBool(key, value);
  }

  Future<bool> setList(String key, List<String> value) async {
    return await prefs.setStringList(key, value);
  }

  Future<bool> setInt(String key, int value) async {
    return await prefs.setInt(key, value);
  }

  Future<bool> setDouble(String key, double value) async {
    return await prefs.setDouble(key, value);
  }

  //*GETTERS
  Future<String?> getString(String key) async {
    return prefs.getString(key);
  }

  Future<List<String>?> getStringList(String key) async {
    return prefs.getStringList(key);
  }

  Future<int?> getInt(String key) async {
    return prefs.getInt(key);
  }

  Future<double?> getDouble(String key) async {
    return prefs.getDouble(key);
  }

  Future<bool?> getBool(String key) async {
    return prefs.getBool(key);
  }
}
