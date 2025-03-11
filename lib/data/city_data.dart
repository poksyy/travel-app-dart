import 'package:flutter/material.dart';
import '../models/city.dart';
import '../l10n/app_localizations.dart';

List<City> getCities(BuildContext context) {
  final localizations = AppLocalizations.of(context)!;

  return [
    City(
      name: 'Manila',
      country: localizations.philippines,
      population: 1780148,
      imagePath: 'assets/images/manila.jpg',
      description: localizations.manilaDescription,
    ),
    City(
      name: 'Quebec',
      country: localizations.canada,
      population: 531000,
      imagePath: 'assets/images/quebec.png',
      description: localizations.quebecDescription,
    ),
    City(
      name: 'Mar del Plata',
      country: localizations.argentina,
      population: 617000,
      imagePath: 'assets/images/mar-de-plata.jpg',
      description: localizations.marDelPlataDescription,
    ),
    City(
      name: 'Barcelona',
      country: localizations.spain,
      population: 1620343,
      imagePath: 'assets/images/barcelona.jpg',
      description: localizations.barcelonaDescription,
    ),
  ];
}
