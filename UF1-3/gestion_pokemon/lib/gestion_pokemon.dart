import 'package:gestion_pokemon/pokemon_fire.dart';
import 'package:gestion_pokemon/pokemon_water.dart';

void printSeparation() {
  print('------------------');
}

List<String> listAllPokemon() {
  List<FirePokemon> firePokemons = FirePokemon.getAll();
  List<WaterPokemon> waterPokemons = WaterPokemon.getAll();

  List<String> pokemonNames = [];

  for (var pokemon in firePokemons) {
    pokemonNames.add(pokemon.name); 
  }

  for (var pokemon in waterPokemons){
    pokemonNames.add(pokemon.name);
  }

  return pokemonNames;
}
