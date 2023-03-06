import 'package:flutter/material.dart';

class AppConfigProvider extends ChangeNotifier{
  String lang = 'en';
  void changeLanguage(String newLang){
    lang = newLang ;
    notifyListeners();
  }
  @override
  void notifyListeners() {
    super.notifyListeners();
  }
}