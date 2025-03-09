import 'package:flutter/material.dart';
import 'package:form_and_list/models/flight.dart';
import 'package:form_and_list/l10n/app_localizations.dart';

class FlightsData {
  static List<Flight> getFlights(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return [
      Flight(
        company: 'AeroSky Airlines',
        day: localizations.monday,
        hour: '10:00 AM',
        departureCity: 'Barcelona',
        arrivalCity: 'Manila',
        price: 450.0,
      ),
      Flight(
        company: 'AeroSky Airlines',
        day: localizations.tuesday,
        hour: '12:30 PM',
        departureCity: 'Barcelona',
        arrivalCity: 'Quebec',
        price: 400.0,
      ),
      Flight(
        company: 'AeroSky Airlines',
        day: localizations.wednesday,
        hour: '8:00 AM',
        departureCity: 'Barcelona',
        arrivalCity: 'Mar de Plata',
        price: 420.0,
      ),
      Flight(
        company: 'BlueWings Aviation',
        day: localizations.thursday,
        hour: '9:00 AM',
        departureCity: 'Barcelona',
        arrivalCity: 'Manila',
        price: 500.0,
      ),
      Flight(
        company: 'BlueWings Aviation',
        day: localizations.friday,
        hour: '2:00 PM',
        departureCity: 'Barcelona',
        arrivalCity: 'Quebec',
        price: 470.0,
      ),
      Flight(
        company: 'BlueWings Aviation',
        day: localizations.saturday,
        hour: '6:00 PM',
        departureCity: 'Barcelona',
        arrivalCity: 'Mar de Plata',
        price: 480.0,
      ),
    ];
  }
}
