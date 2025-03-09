import 'package:flutter/material.dart';
import 'package:form_and_list/models/flight.dart';

class FlightDetailsScreen extends StatelessWidget {
  final Flight flight;

  FlightDetailsScreen({required this.flight});

  @override
  Widget build(BuildContext context) {
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
              'Flight Details',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text('Airline: ${flight.company}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Day: ${flight.day}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Time: ${flight.hour}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Departure City: ${flight.departureCity}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Arrival City: ${flight.arrivalCity}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Price: \$${flight.price.toStringAsFixed(2)}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
