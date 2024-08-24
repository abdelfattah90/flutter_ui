import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/theme_provider.dart';
import 'providers/lang_provider.dart';
import 'theme/theme.dart';
import 'routes/routes.dart';

class MyApp extends StatelessWidget {
  final Locale initialLocale;

  const MyApp({required this.initialLocale, super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final languageProvider = Provider.of<LanguageProvider>(context);

    ThemeData getTheme(String themeName) {
      switch (themeName) {
        case 'light':
          return lightTheme;
        case 'dark':
          return darkTheme;
        case 'beige':
          return beigeTheme;
        default:
          return lightTheme;
      }
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter UI',
      theme: getTheme(themeProvider.themeName),
      darkTheme: darkTheme,
      themeMode: ThemeMode.light,
      locale: languageProvider.appLocale,
      initialRoute: '/',
      routes: routesList,
    );
  }
}
