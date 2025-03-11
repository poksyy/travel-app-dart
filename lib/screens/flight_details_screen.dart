import 'package:flutter/material.dart';
import 'package:form_and_list/models/flight.dart';
import 'package:form_and_list/l10n/app_localizations.dart';

class FlightDetailsScreen extends StatelessWidget {
  final Flight flight;

  FlightDetailsScreen({required this.flight});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text('${flight.company} - ${flight.departureCity} → ${flight.arrivalCity}'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              localizations.flightDetails,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text('${localizations.airline}: ${flight.company}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('${localizations.day}: ${flight.day}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('${localizations.time}: ${flight.hour}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('${localizations.departure_city}: ${flight.departureCity}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('${localizations.arrival_city}: ${flight.arrivalCity}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('${localizations.price}: ${flight.price.toStringAsFixed(2)}€', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
