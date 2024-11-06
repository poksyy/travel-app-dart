class Planet {
  final String name;
  final int rotationPeriod;
  final int orbitalPeriod;
  final int diameter;
  final String climate;
  final String gravity;
  final String url;

  Planet(this.name, this.rotationPeriod, this.orbitalPeriod, this.diameter, this.climate ,this.gravity, this.url);

  String getName() {
    return name;
  }

  int getRotationPeriod(){
    return rotationPeriod;
  }

  int getOrbitalPeriod(){
    return orbitalPeriod;
  }

  int getDiameter() {
    return diameter;
  }

  String getClimate(){
    return climate;
  }

  String getGravity() {
    return gravity;
  }

  String getUrl() {
    return url;
  }
}
