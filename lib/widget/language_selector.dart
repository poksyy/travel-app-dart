import 'package:flutter/material.dart';
import 'package:form_and_list/config/locale_provider.dart';
import 'package:provider/provider.dart';
import 'package:form_and_list/l10n/app_localizations.dart';

class LanguageSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final localeProvider = Provider.of<LocaleProvider>(context);
    final localizations = AppLocalizations.of(context)!;

    return IconButton(
      icon: const Icon(Icons.language),
      onPressed: () {
        showMenu(
          context: context,
          position: RelativeRect.fromLTRB(100, 50, 0, 0),
          items: [
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
          ],
        ).then((value) {
          if (value != null) {
            localeProvider.changeLocale(value);
          }
        });
      },
    );
  }
}
