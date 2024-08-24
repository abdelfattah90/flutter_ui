import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/app_bar.dart';
import '../widgets/card.dart';
import '../../providers/lang_data.dart';
import '../../providers/lang_provider.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LanguageProvider>(context);
    String text2 = LangData.data[provider.appLocale.languageCode]!['text2']!;

    return Scaffold(
      appBar: const AppBarWidget(title: 'User Screen'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CardWidget(),
            const SizedBox(height: 20),
            const Text(
              'Welcome to the User Screen!',
              style: TextStyle(fontSize: 24),
            ),
            Text(text2),
          ],
        ),
      ),
    );
  }
}
