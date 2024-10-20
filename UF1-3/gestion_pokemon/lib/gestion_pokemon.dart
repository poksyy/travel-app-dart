import 'dart:io';

import 'package:gestion_pokemon/globals.dart';
import 'package:gestion_pokemon/pokemon_fire.dart';
import 'package:gestion_pokemon/pokemon_water.dart';

void printSeparation() => print('------------------');

void exercise2() {
  var charmander = FirePokemon('Charmander', 0.6, 8.5, 'Oran Berry');
  var squirtle = WaterPokemon('Squirtle', 0.5, 9.0, 'Oran Berry');

  printSeparation();
  charmander.showInformation();
  printSeparation();
  squirtle.showInformation();
  printSeparation();
}

void exercise3() {
  print("Pokemon list:");
  List allPokemonNames = listAllPokemonNames();

  for (var name in allPokemonNames) {
    print("  - $name");
  }

  printSeparation();
  print("Sorted pokemon list:");
  allPokemonNames.sort();
  allPokemonNames.forEach((name) => print("  - $name"));

  printSeparation();
  print("Pokemon list grouped by the berry they eat:");

  Map<String, List<String>> groupedByBerry = groupPokemonByBerry();

  groupedByBerry.forEach((berry, pokemonList) {
    print("$berry:");
    pokemonList.forEach((pokemon) => print("  - $pokemon"));
  });
}

void exercise4() {
  printSeparation();
  print("Fire type:");
  print(listAllFirePokemon());
  print("Water type:");
  print(listAllWaterPokemon());
  getPokemonWithWaterAbility();
  deletePokemon();
  updatePokemon();
}

Map<String, List<String>> groupPokemonByBerry() {
  Map<String, List<String>> berryPokemonMap = {};

  allPokemons.forEach((pokemon) {
    berryPokemonMap.putIfAbsent(pokemon.berry, () => []).add(pokemon.name);
  });

  return berryPokemonMap;
}

List listAllPokemonNames() {
  return allPokemons.map((pokemon) => pokemon.name).toList();
}

List listAllPokemonBerries() {
  return allPokemons.map((pokemon) => pokemon.berry).toSet().toList();
}

List<String> listAllFirePokemon() {
  return firePokemons.map((pokemon) => pokemon.name).toList();
}

List<String> listAllWaterPokemon() {
  return waterPokemons.map((pokemon) => pokemon.name).toList();
}

void getPokemonWithWaterAbility() {
  printSeparation();

  print("Pokemons with Water Ability:");
  for (var pokemon in waterPokemons) {
    print("  - ${pokemon.name} has the following abilities:");
    pokemon.hydroPump();
    pokemon.protect();
  }
}

void deletePokemon() {
  printSeparation();
  stdout.write("Enter the name of the Pokémon you want to delete: ");
  String? pokemonName = stdin.readLineSync();

  if (pokemonName == null || pokemonName.isEmpty) {
    print("Invalid name.");
    return;
  }

  bool found = false;

  firePokemons.removeWhere((pokemon) {
    if (pokemon.name == pokemonName) {
      found = true;
      return true;
    }
    return false;
  });

  waterPokemons.removeWhere((pokemon) {
    if (pokemon.name == pokemonName) {
      found = true;
      return true;
    }
    return false;
  });

  allPokemons.clear();
  allPokemons.addAll(firePokemons);
  allPokemons.addAll(waterPokemons);

  if (found) {
    print("$pokemonName has been deleted.");
  } else {
    print("No Pokémon found with the name $pokemonName.");
  }
}

void updatePokemon() {
  printSeparation();
  stdout.write("Enter the name of the Pokémon you want to update: ");
  String? oldPokemonName = stdin.readLineSync();

  if (oldPokemonName == null || oldPokemonName.isEmpty) {
    print("Invalid name.");
    return;
  }

  stdout.write("Enter the new name of the Pokémon: ");
  String? newPokemonName = stdin.readLineSync();

  stdout.write("Enter the new berry type of the Pokémon: ");
  String? newBerry = stdin.readLineSync();

  stdout.write("Enter the new height of the Pokémon: ");
  String? newHeightInput = stdin.readLineSync();
  double? newHeight = double.tryParse(newHeightInput ?? '');

  stdout.write("Enter the new weight of the Pokémon: ");
  String? newWeightInput = stdin.readLineSync();
  double? newWeight = double.tryParse(newWeightInput ?? '');

  if (newPokemonName == null ||
      newBerry == null ||
      newHeight == null ||
      newWeight == null) {
    print("Invalid data.");
    return;
  }

  bool found = false;

  int fireIndex =
      firePokemons.indexWhere((pokemon) => pokemon.name == oldPokemonName);
  if (fireIndex != -1) {
    firePokemons[fireIndex] =
        FirePokemon(newPokemonName, newHeight, newWeight, newBerry);
    found = true;
  }

  int waterIndex =
      waterPokemons.indexWhere((pokemon) => pokemon.name == oldPokemonName);
  if (waterIndex != -1) {
    waterPokemons[waterIndex] =
        WaterPokemon(newPokemonName, newHeight, newWeight, newBerry);
    found = true;
  }

  allPokemons.clear();
  allPokemons.addAll(firePokemons);
  allPokemons.addAll(waterPokemons);

  if (found) {
    print("$oldPokemonName has been successfully updated.");
  } else {
    print("No Pokémon found with the name $oldPokemonName.");
  }
}
