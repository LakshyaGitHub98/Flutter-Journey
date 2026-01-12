import 'package:shared_preferences/shared_preferences.dart';

class TaskStorage {
  static const String key = "tasks";

  static Future<void> saveTasks(List<String> tasks) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(key, tasks);
  }

  static Future<List<String>> loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(key) ?? [];
  }
}