import 'package:gestion_pokemon/gestion_pokemon.dart';
import 'package:gestion_pokemon/pokemon_fire.dart';
import 'package:gestion_pokemon/pokemon_water.dart';

void main() {
  var charmander = FirePokemon('Charmander', 0.6, 8.5, 'Male');
  var squirtle = WaterPokemon('Squirtle', 0.5, 9.0, 'Male');
  
  printSeparation();
  charmander.showInformation();
  printSeparation();
  squirtle.showInformation();
  printSeparation();

  charmander.turn();
  charmander.flamethrower();

  squirtle.turn();
  squirtle.protect();
  printSeparation();

  List<String> allPokemonNames = listAllPokemon();

  for (var name in allPokemonNames) {
    print(name);
  }

  printSeparation();

}
