import 'package:flutter/material.dart';
import 'package:form_and_list/models/city.dart';
import 'package:form_and_list/l10n/app_localizations.dart';

class CityProvider with ChangeNotifier {
  final List<City> _cities;

  CityProvider(BuildContext context)
      : _cities = _initializeCities(context);

  List<City> get cities => _cities;

  void removeCity(City city) {
    _cities.remove(city);
    notifyListeners();
  }

  static List<City> _initializeCities(BuildContext context) {
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
}
