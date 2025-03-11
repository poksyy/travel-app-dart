import 'package:flutter/material.dart';
import 'package:form_and_list/config/locale_provider.dart';
import 'package:provider/provider.dart';
import 'package:form_and_list/l10n/app_localizations.dart';

class LanguageSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final localeProvider = Provider.of<LocaleProvider>(context);
    final localizations = AppLocalizations.of(context)!;

    return PopupMenuButton<String>(
      onSelected: (value) {
        localeProvider.changeLocale(value);
      },
      itemBuilder: (BuildContext context) {
        return [
          PopupMenuItem(
            value: 'en',
            child: Text(localizations.english),
          ),
          PopupMenuItem(
            value: 'es',
            child: Text(localizations.spanish),
          ),
          PopupMenuItem(
            value: 'ca',
            child: Text(localizations.catalan),
          ),
        ];
      },
    );
  }
}
