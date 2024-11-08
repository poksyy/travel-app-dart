class Vehicles {
  final String name;
  final String model;
  final String manufacturer;
  final int costInCredits;
  final double length;
  final int maxAtmospheringSpeed;
  final int crew;
  final List<String> films;

  Vehicles(this.name, this.model, this.manufacturer, this.costInCredits, this.length ,this.maxAtmospheringSpeed, this.crew, this.films);

  String getName() {
    return name;
  }

  String getModel(){
    return model;
  }

  String getManufacturer(){
    return manufacturer;
  }

  int getCostInCredits() {
    return costInCredits;
  }

  double getLength(){
    return length;
  }

  int getMaxAtmospheringSpeed() {
    return maxAtmospheringSpeed;
  }

   int getCrew() {
    return crew;
  }

  List<String> getFilms(){
    return films;
  }
}
