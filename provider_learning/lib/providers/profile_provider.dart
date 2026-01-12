import 'package:flutter/material.dart';

class ProfileProvider with ChangeNotifier {
  String _name = "";
  int _age = 0;
  String _gender = "";

  String get name => _name;
  int get age => _age;
  String get gender => _gender;

  void setProfile(String name, int age, String gender) {
    _name = name;
    _age = age;
    _gender = gender;
    notifyListeners();
  }

  void setProfileFromStorage(Map<String, dynamic> data) {
    _name = data["name"] ?? "";
    _age = data["age"] ?? 0;
    _gender = data["gender"] ?? "";
    notifyListeners();
  }

  bool get isLoggedIn => _name.isNotEmpty;
}
