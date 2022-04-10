import 'package:flutter/material.dart';

class RouterProvider extends ChangeNotifier {
  int _curIndex = 0;
  int get curIndex => _curIndex;

  void changePage(int index) {
    _curIndex = index;
    notifyListeners();
  }
}
