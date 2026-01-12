import 'package:flutter/material.dart';

class TaskProvider with ChangeNotifier {
  List<String> _tasks = [];

  List<String> get tasks => List.unmodifiable(_tasks);

  void setTasks(List<String> tasks) {
    _tasks = tasks;
    notifyListeners();
  }

  void addTask(String task) {
    _tasks.add(task);
    notifyListeners();
  }

  void removeTask(int index) {
    if (index >= 0 && index < _tasks.length) {
      _tasks.removeAt(index);
      notifyListeners();
    }
  }

  void clearTasks() {
    _tasks.clear();
    notifyListeners();
  }
}
