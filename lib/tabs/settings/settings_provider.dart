import 'package:flutter/material.dart';

class SettingsProvider with ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;
  String languegeCode = 'en';

  void changeTheme(ThemeMode selectedThemeMode) {
    themeMode = selectedThemeMode;
    notifyListeners();
  }

  chaneLanguage(String selectedLanguage) {
    languegeCode = selectedLanguage;
    notifyListeners();
  }
}
