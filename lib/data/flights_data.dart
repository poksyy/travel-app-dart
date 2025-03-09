import 'package:form_and_list/models/flight.dart';

class FlightsData {
  static final List<Flight> flights = [
    Flight(
      company: 'AeroSky Airlines',
      day: 'Monday',
      hour: '10:00 AM',
      departureCity: 'Barcelona',
      arrivalCity: 'Manila',
      price: 450.0,
    ),
    Flight(
      company: 'AeroSky Airlines',
      day: 'Tuesday',
      hour: '12:30 PM',
      departureCity: 'Barcelona',
      arrivalCity: 'Quebec',
      price: 400.0,
    ),
    Flight(
      company: 'AeroSky Airlines',
      day: 'Wednesday',
      hour: '8:00 AM',
      departureCity: 'Barcelona',
      arrivalCity: 'Mar de Plata',
      price: 420.0,
    ),
    Flight(
      company: 'BlueWings Aviation',
      day: 'Thursday',
      hour: '9:00 AM',
      departureCity: 'Barcelona',
      arrivalCity: 'Manila',
      price: 500.0,
    ),
    Flight(
      company: 'BlueWings Aviation',
      day: 'Friday',
      hour: '2:00 PM',
      departureCity: 'Barcelona',
      arrivalCity: 'Quebec',
      price: 470.0,
    ),
    Flight(
      company: 'BlueWings Aviation',
      day: 'Saturday',
      hour: '6:00 PM',
      departureCity: 'Barcelona',
      arrivalCity: 'Mar de Plata',
      price: 480.0,
    ),
  ];
}
