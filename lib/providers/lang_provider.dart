import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider extends ChangeNotifier {
  Locale _appLocale = const Locale('ar'); // Default locale is Arabic

  Locale get appLocale => _appLocale;

  void changeLanguage(Locale type) async {
    _appLocale = type;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', type.languageCode);
    notifyListeners();
  }

  void fetchLocale() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('language') == null) {
      _appLocale = const Locale('ar');
      return null;
    }
    _appLocale = Locale(prefs.getString('language')!);
    notifyListeners();
  }
}
