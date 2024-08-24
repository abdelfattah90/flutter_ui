import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/theme_provider.dart';
import '../../providers/lang_provider.dart';
import '../../widgets/app_bar.dart';
import '../../widgets/drawer.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final provider = Provider.of<LanguageProvider>(context);

    return Scaffold(
      appBar: const AppBarWidget(title: 'Settings'),
      drawer: const DrawerWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DropdownButton<String>(
            value: themeProvider.themeName,
            onChanged: (String? newTheme) {
              if (newTheme != null) {
                themeProvider.setTheme(newTheme);
              }
            },
            items: <String>['light', 'dark', 'beige']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: DropdownButtonFormField<String>(
              decoration: const InputDecoration(labelText: 'Language'),
              value: provider.appLocale.languageCode,
              onChanged: (String? newValue) {
                if (newValue == 'en') {
                  provider.changeLanguage(const Locale('en'));
                } else if (newValue == 'ar') {
                  provider.changeLanguage(const Locale('ar'));
                }
                Navigator.pop(context);
              },
              items: const <DropdownMenuItem<String>>[
                DropdownMenuItem(
                  value: 'en',
                  child: Text('English'),
                ),
                DropdownMenuItem(
                  value: 'ar',
                  child: Text('العربية'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
