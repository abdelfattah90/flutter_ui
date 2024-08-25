import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;
  String _themeName = 'light';

  ThemeProvider() {
    _loadTheme();
  }

  ThemeMode get themeMode => _themeMode;
  String get themeName => _themeName;

  void setTheme(String themeName) async {
    _themeName = themeName;
    _themeMode = themeName == 'dark' ? ThemeMode.dark : ThemeMode.light;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('themeName', themeName);
    notifyListeners();
  }

  void _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    _themeName = prefs.getString('themeName') ?? 'light';
    _themeMode = _themeName == 'dark' ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
