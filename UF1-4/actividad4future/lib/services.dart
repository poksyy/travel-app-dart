import 'dart:async';
import 'dart:convert';
import 'package:actividad4future/people.dart';
import 'package:http/retry.dart';
import 'package:actividad4future/planet.dart';
import 'package:http/http.dart' as http;

class Services {
  // ignore: non_constant_identifier_names
  final String STAR_WARS_API_URL = 'https://swapi.dev/api/';
  late RetryClient connection;

  Services() {
    setConnection();
  }

  /// Start connection.
  setConnection() {
    connection = RetryClient(http.Client());
  }

  /// Get the connection.
  getConnection() {
    return connection;
  }

  /// Fetch planets from the Star Wars API.
  Future<List<Planet>> getStarWarsPlanets() async {
    List<Planet> planetsList = [];
    late String response;
    // API connection.
    try {
      response = (await getConnection()
          .read(Uri.parse('${STAR_WARS_API_URL}planets')));
    } finally {
      // Handle the result.
      Map<String, dynamic> planets = jsonDecode(response);

      // Iterate through the obtained map.
      planets['results'].forEach((value) {
        Planet newPlanet = Planet(
            value['name'],
            int.parse(
              value['rotation_period'],
            ),
            int.parse(
              value['orbital_period'],
            ),
            int.parse(
              value['diameter'],
            ),
            value['climate'],
            value['gravity'],
            value['url']
            );
        planetsList.add(newPlanet);
      });
    }

    // Return planets list.
    return planetsList;
  }

    /// Fetch people from the Star Wars API.
  Future<List<People>> getStarWarsPeople() async {
    List<People> peopleList = [];
    late String response;
    // API connection.
    try {
      response = (await getConnection()
          .read(Uri.parse('${STAR_WARS_API_URL}people')));
    } finally {
      // Handle the result.
      Map<String, dynamic> people = jsonDecode(response);

      // Iterate through the obtained map.
      people['results'].forEach((value) {
        People newPeople = People(
            value['name'],
            int.parse(
              value['height'],
            ),
            int.parse(
              value['mass'],
            ),
            value['hair_color'],
            value['skin_color'],
            value['eye_color'],
            value['homeworld']
            );
        peopleList.add(newPeople);
      });
    }

    // Return people list.
    return peopleList;
  }

  // Method to close the connection if it's not necessary anymore.
  void closeConnection() {
    getConnection().close();
  }

}
