import 'package:shared_preferences/shared_preferences.dart';

class AppPreference {


  static Future initMySharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();
  }


  static Future setInt( int value) async {
    await _prefs.setInt("onbording", value);
  }

  static int? getInt() {
    final int? value = _prefs.getInt("onbording");
    return value;
  }

  static Future setBoolean(String key, {required bool value}) async {
    await _prefs.setBool(key, value);
  }

  static bool getBoolean(String key) {
    final bool? value = _prefs.getBool(key);
    return value ?? false;
  }


  static late SharedPreferences _prefs;

  static final Future<SharedPreferences> prefsData = SharedPreferences.getInstance();

  static Future<void> setNumberList(List<String> numberList) async {
    final SharedPreferences prefs = await prefsData;
    await prefs.setStringList("numberList", numberList);
  }

  static Future<List<String>> getNumberList() async {
    final SharedPreferences prefs = await prefsData;
    return prefs.getStringList("numberList") ?? [];
  }

  static Future<void> setInstagramList(List<String> InstagramList) async {
    final SharedPreferences prefs = await prefsData;
    await prefs.setStringList("InstagramList", InstagramList);
  }

  static Future<List<String>> getInstagramList() async {
    final SharedPreferences prefs = await prefsData;
    return prefs.getStringList("InstagramList") ?? [];
  }

  static Future<void> setTelegramList(List<String> Telegram) async {
    final SharedPreferences prefs = await prefsData;
    await prefs.setStringList("Telegram", Telegram);
  }

  static Future<List<String>> getTelegramList() async {
    final SharedPreferences prefs = await prefsData;
    return prefs.getStringList("Telegram") ?? [];
  }

  static Future<void> setSnapchatList(List<String> snapchat) async {
    final SharedPreferences prefs = await prefsData;
    await prefs.setStringList("snapchat", snapchat);
  }

  static Future<List<String>> getSnapchatList() async {
    final SharedPreferences prefs = await prefsData;
    return prefs.getStringList("snapchat") ?? [];
  }







  // static Future<bool> setSaveUserData(bool value) async {
  //   final SharedPreferences prefs = await prefsData;
  //   return await prefs.setBool('flag', value);
  // }
  //
  // static Future getSaveUserData() async {
  //   final SharedPreferences prefs = await prefsData;
  //   prefs.getBool("flag") ?? false;
  // }

  static Future<void> remove() async {
    final SharedPreferences prefs = await prefsData;
    await prefs.remove("numberList");
  }

  static Future<void> clear() async {
    final SharedPreferences prefs = await prefsData;
    await prefs.clear();
  }
// }
//
//
//
//
// class AppPreference {
//   static late SharedPreferences _prefs;
  static const _whatsApp = 'whatsApp';
  static const _autoResponse = 'autoResponse';
  static const _fbMassager = 'fbMassager';
  static const _instagram = 'instagram';
  static const _whatsAppBusi = 'whatsAppBusi';
  static const _telegram = 'telegram';
  static const _twitter = 'twitter';
  static const _notification = 'notification';

  // static Future initMySharedPreferences() async {
  //   _prefs = await SharedPreferences.getInstance();
  // }

  static void clearSharedPreferences(String value) {
    _prefs.remove(value);
    return;
  }

  // static const String theme = "theme";


  ///-------------
  static Future setString(String key, String value) async {
    await _prefs.setString(key, value);
  }

  static String getString(String key) {
    final String? value = _prefs.getString(key);
    return value ?? "";
  }

  // static Future setBoolean(String key, {required bool value}) async {
  //   await _prefs.setBool(key, value);
  // }
  //
  // static bool getBoolean(String key) {
  //   final bool? value = _prefs.getBool(key);
  //   return value ?? false;
  // }

  static Future setLong(String key, double value) async {
    await _prefs.setDouble(key, value);
  }

  static double getLong(String key) {
    final double? value = _prefs.getDouble(key);
    return value ?? 0.0;
  }

  // static Future setInt(String key, int value) async {
  //   await _prefs.setInt(key, value);
  // }
  //
  // static int getInt(String key) {
  //   final int? value = _prefs.getInt(key);
  //   return value ?? 0;
  // }

  static Future setInComingKeyword(String key, String value) async {
    await _prefs.setString(key, value);
  }

  static String getInComingKeyword(String key) {
    final String? value = _prefs.getString(key);
    return value ?? "";
  }

  ///
  static Future<void> setWhatsApp({required bool whatsApp}) async {
    final SharedPreferences prefs = _prefs;
    prefs.setBool(_whatsApp, whatsApp);
  }

  static Future<void> setAutoResponse({required bool autoResponse}) async {
    final SharedPreferences prefs = _prefs;
    prefs.setBool(_autoResponse, autoResponse);
  }

  static Future<void> setFbMassager({required bool fbMassager}) async {
    final SharedPreferences prefs = _prefs;
    prefs.setBool(_fbMassager, fbMassager);
  }

  static Future<void> setInstagram({required bool instagram}) async {
    final SharedPreferences prefs = _prefs;
    prefs.setBool(_instagram, instagram);
  }

  static Future<void> setWhatsAppBusi({required bool whatsAppBusi}) async {
    final SharedPreferences prefs = _prefs;
    prefs.setBool(_whatsAppBusi, whatsAppBusi);
  }

  static Future<void> setTelegram({required bool telegram}) async {
    final SharedPreferences prefs = _prefs;
    prefs.setBool(_telegram, telegram);
  }

  static Future<void> setTwitter({required bool twitter}) async {
    final SharedPreferences prefs = _prefs;
    prefs.setBool(_twitter, twitter);
  }

  static Future<void> setNotification({required bool notification}) async {
    final SharedPreferences prefs = _prefs;
    prefs.setBool(_notification, notification);
  }

  static bool get whatsApp {
    final bool value = _prefs.getBool(_whatsApp) ?? false;
    return value;
  }

  static bool get autoResponse {
    final bool value = _prefs.getBool(_autoResponse) ?? false;
    return value;
  }

  static bool get fbMassager {
    final bool value = _prefs.getBool(_fbMassager) ?? false;
    return value;
  }

  static bool get instagrams {
    final bool value = _prefs.getBool(_instagram) ?? false;
    return value;
  }

  static bool get whatsAppBusi {
    final bool value = _prefs.getBool(_whatsAppBusi) ?? false;
    return value;
  }

  static bool get telegram {
    final bool value = _prefs.getBool(_telegram) ?? false;
    return value;
  }

  static bool get twitter {
    final bool value = _prefs.getBool(_twitter) ?? false;
    return value;
  }

  static bool get notification {
    final bool value = _prefs.getBool(_notification) ?? false;
    return value;
  }

// final bool value = _prefs.getBool(_everyone) ?? false;
// return value;

// static Future setUserToken(String token) async {
//   await _prefs.setString(Constants.keyToken, token);
// }
//
// static Future setUser(User? user) async {
//   user?.jwtToken = "";
//   await _prefs.setString(Constants.keyUser, jsonEncode(user));
// }
//
// static String? getUserToken() {
//   return _prefs.get(Constants.keyToken) as String?;
// }
//
// static User? getUser() {
//   return User.fromJson(
//       jsonDecode(_prefs.get(Constants.keyUser) as String? ?? ""));
// }
//
// static bool isUserLogin() {
//   final String? getToken = getUserToken();
//   return getToken != null && getToken.isNotEmpty;
// }
}

