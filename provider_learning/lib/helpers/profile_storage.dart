import 'package:shared_preferences/shared_preferences.dart';

class ProfileStorage {
  static Future<void> saveProfile(
      String name, int age, String gender) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("name", name);
    await prefs.setInt("age", age);
    await prefs.setString("gender", gender);
  }

  static Future<Map<String, dynamic>> loadProfile() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      "name": prefs.getString("name") ?? "",
      "age": prefs.getInt("age") ?? 0,
      "gender": prefs.getString("gender") ?? "",
    };
  }
}
