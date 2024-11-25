import 'dart:async';
import 'dart:convert';
import 'package:actividad4future/planet.dart';
import 'package:actividad4future/people.dart';
import 'package:actividad4future/films.dart';
import 'package:actividad4future/vehicles.dart';
import 'package:http/retry.dart';
import 'package:http/http.dart' as http;

class Services {
  // ignore: non_constant_identifier_names
  static const String starWarsApiUrl = 'https://swapi.dev/api/';
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
    late final String response;
    // API connection.
    try {
      response = await getConnection()
          .read(Uri.parse('${starWarsApiUrl}planets'));
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
            value['url']);
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
      response =
          (await getConnection().read(Uri.parse('${starWarsApiUrl}people')));
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
            value['homeworld']);
        peopleList.add(newPeople);
      });
    }

    // Return people list.
    return peopleList;
  }

  /// Fetch people from the Star Wars API.
  Future<List<Vehicles>> getStarWarsVehicles() async {
    List<Vehicles> vehiclesList = [];
    late String response;
    // API connection.
    try {
      response = (await getConnection()
          .read(Uri.parse('${starWarsApiUrl}vehicles')));
    } finally {
      // Handle the result.
      Map<String, dynamic> vehicles = jsonDecode(response);

      // Iterate through the obtained map.
      vehicles['results'].forEach((value) {
        Vehicles newVehicles = Vehicles(
            value['name'],
            value['model'],
            value['manufacturer'],
            int.tryParse(value['cost_in_credits']) ?? 0,
            double.parse(value['length']),
            int.tryParse(value['max_atmosphering_speed']) ?? 0,
            int.parse(value['crew']),
            List<String>.from(value['films']));

        vehiclesList.add(newVehicles);
      });
    }

    // Return people list.
    return vehiclesList;
  }

  /// Fetch people from the Star Wars API.
  Future<List<Films>> getStarWarsFilms() async {
    List<Films> filmsList = [];
    late String response;
    // API connection.
    try {
      response =
          (await getConnection().read(Uri.parse('${starWarsApiUrl}films')));
    } finally {
      // Handle the result.
      Map<String, dynamic> films = jsonDecode(response);

      // Iterate through the obtained map.
      films['results'].forEach((value) {
        Films newFilms = Films(
            value['title'],
            int.tryParse(value['episode_id'].toString()) ?? 0,
            value['opening_crawl'],
            value['director'],
            value['producer'],
            value['release_date'],
            value['url']);
        filmsList.add(newFilms);
      });
    }

    // Return people list.
    return filmsList;
  }

  // Method to close the connection if it's not necessary anymore.
  void closeConnection() {
    getConnection().close();
  }
}
