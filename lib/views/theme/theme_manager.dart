import 'package:cardealership/helpers/my_var.dart';
import 'package:flutter/material.dart';

class ThemeManager extends ChangeNotifier {
  static ThemeManager instance = ThemeManager();
  ThemeMode _themeMode = ThemeMode.dark;
  getMode() => _themeMode;

  toggleTheme(
    bool isDark,
  ) {
    _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    cardColor =
        isDark ? Colors.black : const Color.fromARGB(255, 242, 242, 242);

    notifyListeners();
  }
}
