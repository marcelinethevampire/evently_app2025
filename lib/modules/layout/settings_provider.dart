import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier{
  ThemeMode currentTheme = ThemeMode.light;
  String currentLanguage = 'en';
  final List<String> _langaugesList = [
    "English",
    "العربية"
  ];
  final List<String> _themeList = [
    "Light",
    "Dark"
  ];
  List<String> get languagesList => _langaugesList;
  List<String> get themeList => _themeList;
  void setCurrentLanguage(String newLanguage){
    if(newLanguage == currentLanguage) return;
    currentLanguage = newLanguage;
    notifyListeners();
  }
  void setCurrentTheme(ThemeMode newTheme){
    if(newTheme == currentTheme) return;
    currentTheme = newTheme;
    notifyListeners();
  }
  bool isDark(){
    return currentTheme == ThemeMode.dark;
  }
}