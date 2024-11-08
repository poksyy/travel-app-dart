class People {
  final String name;
  final int height;
  final int mass;
  final String hairColor;
  final String skinColor;
  final String eyeColor;
  final String homeworld;

  People(this.name, this.height, this.mass, this.hairColor, this.skinColor,
      this.eyeColor, this.homeworld);

  String getName() {
    return name;
  }

  int getHeight() {
    return height;
  }

  int getMass() {
    return mass;
  }

  String getHairColor() {
    return hairColor;
  }

  String getSkinColor() {
    return skinColor;
  }

  String getEyeColor() {
    return eyeColor;
  }

  // Get the number from the homeworld link of the API.
  int getNumberHomeworld() {
    //https://swapi.dev/api/planets/#/ -> homeworld format
    String homeworldNumberExtract = homeworld.replaceAll(RegExp(r'[^0-9]'), '');
    int homeworldNumber = int.parse(homeworldNumberExtract);
    return homeworldNumber;
  }

  String getHomeworld() {
    return homeworld;
  }
}
