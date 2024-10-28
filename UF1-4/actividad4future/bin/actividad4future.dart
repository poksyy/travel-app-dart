import 'dart:async';
import 'dart:io';

import 'package:actividad4future/people.dart';
import 'package:actividad4future/planet.dart';
import 'package:actividad4future/services.dart';

// Main asynchronous class.
Future<void> main(List<String> arguments) async {
  List<Planet> planetList = [];
  List<People> peopleList = [];
  List<People> peoplePlanetList = [];
  Services service = Services();

  try {
    // Fetch and display planets.
    planetList = await service.getStarWarsPlanets();
    for (Planet item in planetList) {
      print(
          "The planet ${item.getName()} has a diameter of ${item.getDiameter()} km, gravity: ${item.getGravity()}, with a rotation period of ${item.getRotationPeriod()} and an orbital period of ${item.getOrbitalPeriod()}");
    }

    print("------------------------------------------------------------");

    // Fetch and display people from a specific planet in the terminal.
    stdout.write("Enter the planet number (ID) to check its inhabitants:");
    String? planetIdInput = stdin.readLineSync();

    // The input cannot be null or empty.
    if (planetIdInput == null || planetIdInput.isEmpty) {
      print("Invalid id.");
      return;
    }

    // Parsing String to int
    int planetId = int.tryParse(planetIdInput) ?? -1;

    //Fetch all the people first.
    peopleList = await service.getStarWarsPeople();

    // Filter inhabitants by planet ID.
    for (People person in peopleList) {
      if (planetId == person.getNumberHomeworld()) {
        peoplePlanetList.add(person);
      }
    }

    // Display inhabitants of the specific planet.
    if (peoplePlanetList.isEmpty) {
      print("There are no inhabitants on the planet with ID: $planetId.");
    } else {
      for (People item in peoplePlanetList) {
        "${item.getName()} with a height of ${item.getHeight()} and weight ${item.getMass()} has hair ${item.getHairColor()}, skin color ${item.getSkinColor()}, and eye color ${item.getEyeColor()}";
      }
    }
  } catch (error) {
    print("Error during execution: $error");
  } finally {}

  // Close connection.
  service.closeConnection();
}
