import 'package:flutter/material.dart';
import 'package:form_and_list/l10n/app_localizations.dart';
import 'package:form_and_list/data/flights_data.dart';
import 'package:form_and_list/models/flight.dart';
import 'package:form_and_list/screens/flight_details_screen.dart';
import 'package:form_and_list/widget/flight_item.dart';
import 'package:form_and_list/widget/language_selector.dart';

class FlightScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    final Map<String, List<Flight>> groupedFlights = {};
    for (var flight in FlightsData.getFlights(context)) {
      groupedFlights.putIfAbsent(flight.company, () => []).add(flight);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.availableFlights),
        backgroundColor: Theme.of(context).primaryColor,
        actions: [LanguageSelector()],
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
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Column(
                  children: companyFlights.map((flight) {
                    return FlightItem(
                      flight: flight,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FlightDetailsScreen(flight: flight),
                          ),
                        );
                      },
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
