import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {

  static final _kLoginUsername = 'kLoginUsername';
  static final _kLoginPassword= 'kLoginPassword';
  static final _kToken= 'kToken';
  static final _kUserID= 'kUserID';

  /// ------------------------------GET------------------------------
  static Future<String> getUserName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_kLoginUsername) ?? '';
  }

  static Future<String> getPassword() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_kLoginPassword) ?? '';
  }

  static Future<String> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_kToken) ?? '';
  }

  static Future<int> getUserID() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_kUserID) ?? 0;
  }

  /// --------------------SAVE--------------------------------------
  static Future<bool> setUsername(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(_kLoginUsername, value);
  }

  static Future<bool> setPassword(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(_kLoginPassword, value);
  }

  static Future<bool> setToken(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(_kToken, value);
  }

  static Future<bool> setUserID(int value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setInt(_kUserID, value);
  }


  /// --------------------REMOVE--------------------------------------

  static Future<bool> removeUsername(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove(_kLoginUsername);
  }

  static Future<bool> removePassword(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove(_kLoginPassword);
  }

  static Future<bool> removeToken(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove(_kToken);
  }

  static Future<bool> removeUserID(int value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove(_kUserID);
  }
}