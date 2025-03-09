import 'package:flutter/material.dart';
import 'package:form_and_list/data/flights_data.dart';
import 'package:form_and_list/models/flight.dart';
import 'package:form_and_list/screens/flight_details_screen.dart';

class FlightScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String, List<Flight>> groupedFlights = {};

    for (var flight in FlightsData.flights) {
      if (!groupedFlights.containsKey(flight.company)) {
        groupedFlights[flight.company] = [];
      }
      groupedFlights[flight.company]?.add(flight);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Available Flights'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ListView.builder(
        itemCount: groupedFlights.length,
        itemBuilder: (context, index) {
          String company = groupedFlights.keys.elementAt(index);
          List<Flight> companyFlights = groupedFlights[company]!;

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, bottom: 8.0, top: 16.0),
                  child: Text(
                    company,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Column(
                  children: companyFlights.map((flight) {
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 12),
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                        title: Text(
                          '${flight.departureCity} → ${flight.arrivalCity}',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('${flight.day} - ${flight.hour}', style: TextStyle(fontSize: 14, color: Colors.black)),
                            Text(
                              '\$${flight.price.toStringAsFixed(2)}',
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        onTap: () {
                          // Navigate to FlightDetailsScreen when tapped
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FlightDetailsScreen(flight: flight),
                            ),
                          );
                        },
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
