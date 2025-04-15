import 'package:flutter/material.dart';

class SettingsProvider with ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;
  String languageCode = 'ar';

  String get backgroundImageName =>
      themeMode == ThemeMode.light ? 'default_bg' : 'dark_bg';

  void changeTheme(ThemeMode selectedTheme) {
    if (selectedTheme == themeMode) return;
    themeMode = selectedTheme;
    notifyListeners();
  }

  void changeLanguageCode(String selectedLanaguage) {
    if (selectedLanaguage == languageCode) return;
    languageCode = selectedLanaguage;
    notifyListeners();
  }
}
