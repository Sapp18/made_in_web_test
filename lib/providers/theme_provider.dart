import 'package:flutter/material.dart';

import '../app/app.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData currentTheme;

  ThemeProvider({required bool isDarkmode})
      : currentTheme = isDarkmode ? AppTheme.darkMode : AppTheme.lightMode;

  setLightMode() {
    currentTheme = AppTheme.lightMode;
    notifyListeners();
  }

  setDarkMode() {
    currentTheme = AppTheme.darkMode;
    notifyListeners();
  }
}
