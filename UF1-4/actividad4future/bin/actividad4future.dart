import 'dart:async';
import 'dart:io';

import 'package:actividad4future/films.dart';
import 'package:actividad4future/people.dart';
import 'package:actividad4future/planet.dart';
import 'package:actividad4future/services.dart';
import 'package:actividad4future/globals.dart';
import 'package:actividad4future/vehicles.dart';

// Main asynchronous class.
Future<void> main(List<String> arguments) async {
  List<Planet> planetList = [];
  List<People> peopleList = [];
  List<Vehicles> vehiclesList = [];
  List<People> peoplePlanetList = [];
  List<Films> filmsList = [];
  Services service = Services();

  try {
    // Fetch and display planets.
    planetList = await service.getStarWarsPlanets();
    print("${ConsoleColors.yellow}List of planets:");
    for (Planet item in planetList) {
      print(
          '${ConsoleColors.blue}The planet ${item.getName()} has a diameter of ${item.getDiameter()} km, gravity: ${item.getGravity()}, with a rotation period of ${item.getRotationPeriod()} and an orbital period of ${item.getOrbitalPeriod()}${ConsoleColors.reset}');
    }

    print(
        "${ConsoleColors.green}------------------------------------------------------------${ConsoleColors.reset}");

    // Fetch and display people from a specific planet in the terminal.
    stdout.write(
        "${ConsoleColors.yellow}Enter the planet number (ID) to check its inhabitants:${ConsoleColors.reset}");
    String? planetIdInput = stdin.readLineSync();

    // The input cannot be null or empty.
    if (planetIdInput == null || planetIdInput.isEmpty) {
      print("${ConsoleColors.red}Invalid id.${ConsoleColors.reset}");
      return;
    }

    // Parsing String to int
    int planetId = int.tryParse(planetIdInput) ?? -1;

    // Saving planet name

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
      print(
          "${ConsoleColors.red}There are no inhabitants on the planet with ID: $planetId.${ConsoleColors.reset}");
    } else {
      for (People item in peoplePlanetList) {
        print(
            '${ConsoleColors.cyan}${item.getName()} with a height of ${item.getHeight()} and weight ${item.getMass()} has hair ${item.getHairColor()}, skin color ${item.getSkinColor()}, and eye color ${item.getEyeColor()}${ConsoleColors.reset}');
      }
    }
  } catch (error) {
    print(
        "${ConsoleColors.red}Error during execution: $error${ConsoleColors.reset}");
  } finally {}

  print(
      "${ConsoleColors.green}------------------------------------------------------------${ConsoleColors.reset}");

  // Fetch and display people from a specific planet in the terminal.
  stdout.write(
      "${ConsoleColors.yellow}Enter the people name to check its homeworld:${ConsoleColors.reset}");
  String? peopleNameInput = stdin.readLineSync();

  // The input cannot be null or empty.
  if (peopleNameInput == null || peopleNameInput.isEmpty) {
    print("${ConsoleColors.red}Invalid name.${ConsoleColors.reset}");
    return;
  }

  for (People person in peopleList) {
    if (peopleNameInput == person.getName()) {
      for (Planet item in planetList) {
        if (person.getHomeworld() == item.url) {
          print(
              '${ConsoleColors.cyan}$peopleNameInput lives in the planet ${item.getName()} has a diameter of ${item.getDiameter()} km, gravity: ${item.getGravity()}, with a rotation period of ${item.getRotationPeriod()} and an orbital period of ${item.getOrbitalPeriod()}.${ConsoleColors.reset}');
        }
      }
    }
  }
  print(
      "${ConsoleColors.green}------------------------------------------------------------${ConsoleColors.reset}");

  // Fetch and display movie from a specific vehicle in the terminal.
  vehiclesList = await service.getStarWarsVehicles();
  filmsList = await service.getStarWarsFilms();

  stdout.write(
      "${ConsoleColors.yellow}Enter the vehicle name to check its films:${ConsoleColors.reset}");
  String? vehicleNameInput = stdin.readLineSync();

  // The input cannot be null or empty.
  if (vehicleNameInput == null || vehicleNameInput.isEmpty) {
    print("${ConsoleColors.red}Invalid name.${ConsoleColors.reset}");
    return;
  }

  for (Vehicles vehicle in vehiclesList) {
    if (vehicleNameInput == vehicle.getName()) {
      print(
          "${ConsoleColors.cyan}Films found for vehicle ${vehicle.getName()}:${ConsoleColors.reset}");

      for (String filmUrl in vehicle.getFilms()) {
        for (Films film in filmsList) {
          if (filmUrl == film.getUrl()) {
            print(
                "${ConsoleColors.cyan}Title: ${film.getTitle()}, Episode ID: ${film.getEpisodeId()}, Director: ${film.getDirector()}, Producer: ${film.getProducer()}, Release Date: ${film.getReleaseDate()}${ConsoleColors.reset}");
          }
        }
      }
    }
  }

  // Close connection.
  service.closeConnection();
}
