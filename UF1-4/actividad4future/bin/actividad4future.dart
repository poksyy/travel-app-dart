import 'dart:async';

import 'package:actividad4future/planet.dart';
import 'package:actividad4future/services.dart';

//Clase principal como asíncrona
Future<void> main(List<String> arguments) async {
  // Listado de planetas
  List<Planet> planetList = [];

  //Petición mediante un servicio
  Services service = Services();


//Activaria una animación

  service.getStarWarsPlanets().then((response) {
    planetList = response;

    //Tratamiento de datos de forma individual
    for (Planet item in planetList) {
      print(
          "El planeta ${item.getName()} tiene ${item.getDiameter()}Kms de diametro y gravedad: ${item.getGravity()} con un tiempo de rotación de ${item.getRotationPeriod()} y de orbita ${item.getOrbitalPeriod()}");
    }

    //Desactivaría la animación.
    
  });
}
