import 'package:gestion_pokemon/abilities.dart';
import 'package:gestion_pokemon/pokemon.dart';

class WaterPokemon extends Pokemon with WaterAbility {
  WaterPokemon(String name, double height, double weight, String berry)
      : super(
          name: name,
          type: 'Water',
          height: height,
          weight: weight,
          berry: berry,
        );

  static List<WaterPokemon> getAll() {
    return [
      WaterPokemon('Squirtle', 0.5, 9.0, 'Oran Berry'),
      WaterPokemon('Psyduck', 0.8, 19.6, 'Sitrus Berry'),
      WaterPokemon('Poliwag', 0.6, 12.4, 'Pecha Berry'),
    ];
  }
}
