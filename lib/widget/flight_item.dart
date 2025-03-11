import 'package:flutter/material.dart';
import 'package:form_and_list/models/flight.dart';

class FlightItem extends StatelessWidget {
  final Flight flight;
  final VoidCallback onTap;

  const FlightItem({super.key, required this.flight, required this.onTap});

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 12),
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          title: Text(
            '${flight.departureCity} → ${flight.arrivalCity}',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('${flight.day} - ${flight.hour}', style: const TextStyle(fontSize: 14, color: Colors.black)),
              Text(
                '${flight.price.toStringAsFixed(2)}€',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
