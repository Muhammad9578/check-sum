import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class JsonStorage {
  static String zodiacSignKey = 'zodiacSignKey';
  static String luckyPlateNoKey = 'luckyPlateNoKey';

  static Future<void> saveJson(
      List jsonMap, bool fromZodiac) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = json.encode(jsonMap);
    await prefs.setString(
        fromZodiac ? zodiacSignKey : luckyPlateNoKey, jsonString);
  }

  static Future<List> readJson(bool fromZodiac) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString =
        prefs.getString(fromZodiac ? zodiacSignKey : luckyPlateNoKey);
    if (jsonString != null) {
      return json.decode(jsonString);
    }
    return [];
  }
}
