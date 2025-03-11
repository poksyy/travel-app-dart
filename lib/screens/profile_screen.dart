import 'package:flutter/material.dart';
import 'package:form_and_list/l10n/app_localizations.dart';
import 'package:form_and_list/widget/language_selector.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  void logout(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.profile),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Theme.of(context).appBarTheme.foregroundColor,
        actions: [LanguageSelector()],
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => logout(context),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
          ),
          child: Text(
            localizations.logout,
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
