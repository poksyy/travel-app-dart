import 'package:gestion_pokemon/pokemon_fire.dart';
import 'package:gestion_pokemon/pokemon_water.dart';

final List<FirePokemon> firePokemons = FirePokemon.getAll();
final List<WaterPokemon> waterPokemons = WaterPokemon.getAll();
final List<dynamic> allPokemons = [...firePokemons, ...waterPokemons];