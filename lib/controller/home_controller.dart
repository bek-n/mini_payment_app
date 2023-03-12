import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier{
  int currentIndex = 0;


  setIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }
}