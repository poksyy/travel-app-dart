import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  void logout(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Theme.of(context).appBarTheme.foregroundColor,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => logout(context),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
          ),
          child: const Text(
            "Log Out",
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
