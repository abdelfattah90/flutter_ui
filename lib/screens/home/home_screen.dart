import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/app_bar.dart';
import '../../widgets/card.dart';
import '../../widgets/drawer.dart';

import '../../providers/lang_data.dart';
import '../../providers/lang_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LanguageProvider>(context);
    String text1 = LangData.data[provider.appLocale.languageCode]!['text1']!;

    return Scaffold(
      appBar: const AppBarWidget(title: 'Flutter UI'),
      drawer: const DrawerWidget(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CardWidget(),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, 'user');
              },
              child: const Text('Go to User Screen'),
            ),
            Text(text1),
          ],
        ),
      ),
    );
  }
}
