import 'package:flutter/material.dart';

class NavigatingState with ChangeNotifier {
  int pageIndex = 0;
  changePageIndexTo(int index) {
    pageIndex = index;
    notifyListeners();
  }
}
