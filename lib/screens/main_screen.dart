import 'package:flutter/material.dart';
import 'package:form_and_list/screens/home_screen.dart';
import 'package:form_and_list/screens/flights_screen.dart';
import 'package:form_and_list/screens/profile_screen.dart';
import 'package:form_and_list/l10n/app_localizations.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(user: 'User'),
    FlightScreen(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: localizations.home,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.flight),
            label: localizations.fligths,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: localizations.profile,
          ),
        ],
      ),
    );
  }
}
