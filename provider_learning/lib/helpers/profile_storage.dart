import 'package:shared_preferences/shared_preferences.dart';

class ProfileStorage {
  static const _nameKey = "name";
  static const _ageKey = "age";
  static const _genderKey = "gender";

  static Future<void> saveProfile(
      String name, int age, String gender) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_nameKey, name);
    await prefs.setInt(_ageKey, age);
    await prefs.setString(_genderKey, gender);
  }

  static Future<Map<String, dynamic>?> getProfile() async {
    final prefs = await SharedPreferences.getInstance();

    if (!prefs.containsKey(_nameKey)) return null;

    return {
      "name": prefs.getString(_nameKey),
      "age": prefs.getInt(_ageKey),
      "gender": prefs.getString(_genderKey),
    };
  }

  static Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
