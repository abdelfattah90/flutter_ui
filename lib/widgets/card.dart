import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    // Determine the card color based on the current theme
    Color getCardColor(String themeName) {
      switch (themeName) {
        case 'beige':
          return Colors.brown;
        case 'dark':
          return Colors.red;
        default:
          return Colors.green;
      }
    }

    return Card(
      color: getCardColor(themeProvider.themeName),
      child: const SizedBox(
        width: 300,
        height: 200,
        child: Center(
          child: Text(
            'This is a card',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
