class Pokemon {
  String name;
  String type;
  double height;
  double weight;
  String gender;

  Pokemon({
    required this.name,
    required this.type,
    required this.height,
    required this.weight,
    required this.gender,
  });

  void showInformation() {
    print("Name: $name");
    print("Type: $type");
    print("Height: ${height.toStringAsFixed(2)} m");
    print("Weight: ${weight.toStringAsFixed(2)} kg");
    print("Gender: $gender");
  }

  void turn() {
    print('Turn of $name!');
  }
}
