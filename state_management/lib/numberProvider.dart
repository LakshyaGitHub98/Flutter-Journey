import 'package:flutter/material.dart';

class NumberProvider with ChangeNotifier {
  List<int> _numbers = [1,2,3];

  List<int> get numbers => _numbers;

  void addNumber() {
    int value=_numbers.last;
    _numbers.add(value+1);
    notifyListeners();
  }

  void clearNumbers() {
    _numbers.clear();
    notifyListeners();
  }
}