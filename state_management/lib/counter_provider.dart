import 'package:flutter/material.dart';
class CounterProvider extends ChangeNotifier{
  int _count=0;
  /// Get value
  int getcount()=>_count;
  /// Events
  void incrementcounter(){
    _count++;
    notifyListeners();
  }
  void decrementcounter(){
    if(_count>0) {
      _count--;
      notifyListeners();
    }
  }

}