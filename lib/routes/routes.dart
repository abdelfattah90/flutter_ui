import '../screens/home/home_screen.dart';
import '../screens/settings/settings.dart';
import '../screens/sqflite/sqflite.dart';
import '../screens/user_screen.dart';

final routesList = {
  '/': (context) => const HomeScreen(),
  'user': (context) => const UserScreen(),
  'settings': (context) => const Settings(),
  'sqflite': (context) => const SqfliteScreen(),
};
