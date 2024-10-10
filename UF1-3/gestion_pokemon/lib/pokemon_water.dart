import 'package:gestion_pokemon/abilities.dart';
import 'package:gestion_pokemon/pokemon.dart';

class WaterPokemon extends Pokemon with WaterAbility {
  WaterPokemon(String name, double height, double weight, String gender) : super(
    name: name,
    type: 'Water',
    height: height,
    weight: weight,
    gender: gender,
  );

  static List<WaterPokemon> getAll() {
    return [
      WaterPokemon('Squirtle', 0.5, 9.0, 'Male'),
      WaterPokemon('Psyduck', 0.8, 19.6, 'Male'),
      WaterPokemon('Poliwag', 0.6, 12.4, 'Male'),
    ];
  }
}
