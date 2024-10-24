import 'dart:async';
import 'dart:convert';
import 'package:http/retry.dart';
import 'package:actividad4future/planet.dart';
import 'package:http/http.dart' as http;

class Services {
  final String STAR_WARS_API_URL = 'https://swapi.dev/api/';
  late RetryClient connection;

  Services() {
    setConnection();
  }

  /// Inicializa la conexión
  setConnection() {
    connection = RetryClient(http.Client());
  }

  /// Obtiene la conexión
  getConnection() {
    return connection;
  }

  /// Obtiene planetas del api de Start Wars
  Future<List<Planet>> getStarWarsPlanets() async {
    List<Planet> planetsList = [];
    late String response;
    // Conexión con el API
    try {
      response = (await getConnection()
          .read(Uri.parse('${STAR_WARS_API_URL}planets')));
    } finally {
      // Tratar el resultado
      Map<String, dynamic> planets = jsonDecode(response);

      // Recorrer mapa obtenido
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
            value['gravity']
            );
        planetsList.add(newPlanet);
      });

      // Cerramos conexión
      getConnection().close();
    }

    // Devuelve el listado de planetas.
    return planetsList;
  }
}
