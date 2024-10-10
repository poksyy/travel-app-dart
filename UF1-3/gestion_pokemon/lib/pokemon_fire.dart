import 'package:gestion_pokemon/abilities.dart';
import 'package:gestion_pokemon/pokemon.dart';

class FirePokemon extends Pokemon with FireAbility {
  FirePokemon(String name, double height, double weight, String gender) : super(
    name: name,
    type: 'Fire',
    height: height,
    weight: weight,
    gender: gender,
  );

  static List<FirePokemon> getAll() {
    return [
      FirePokemon('Charmander', 0.6, 8.5, 'Male'),
      FirePokemon('Vulpix', 0.6, 9.0, 'Female'),
      FirePokemon('Growlithe', 0.7, 9.0, 'Male'),
    ];
  }
}
