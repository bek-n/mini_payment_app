import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_model.dart';

class HomeController extends ChangeNotifier {
  int currentIndex = 0;

  setIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  
}
