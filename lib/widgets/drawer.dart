import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  String? _selectedRoute;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Update the selected route when the drawer is opened
    setState(() {
      _selectedRoute = ModalRoute.of(context)?.settings.name;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color(0xFF4E7246),
            ),
            child: Text(
              'Drawer Header',
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                _buildListTile(
                  context,
                  icon: FontAwesomeIcons.house,
                  title: 'Home',
                  routeName: '/',
                ),
                _buildListTile(
                  context,
                  icon: FontAwesomeIcons.gear,
                  title: 'Settings',
                  routeName: 'settings',
                ),
                _buildListTile(
                  context,
                  icon: FontAwesomeIcons.book,
                  title: 'Sqflite',
                  routeName: 'sqflite',
                ),
              ],
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }

  Widget _buildListTile(BuildContext context,
      {required IconData icon,
      required String title,
      required String routeName}) {
    final isSelected = _selectedRoute == routeName;

    return ListTile(
      leading: Icon(
        icon,
        color: isSelected
            ? Theme.of(context).primaryColor
            : const Color(0xFFC6C6C6),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: isSelected ? Theme.of(context).primaryColor : Colors.black,
        ),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: Colors.grey.shade600,
        size: 16,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      tileColor: isSelected
          ? Theme.of(context).primaryColor.withOpacity(0.1)
          : const Color(0xFFF8F8F8),
      onTap: () {
        if (!isSelected) {
          Navigator.pop(context);
          Navigator.pushReplacementNamed(context, routeName);
        }
      },
    );
  }
}
