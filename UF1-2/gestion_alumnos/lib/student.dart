import 'package:gestion_alumnos/module.dart';

class Student {
  String name;
  String surnames;
  String dni;
  int age;
  List<Module> module;
  String repeater;

  Student(this.name, this.surnames, this.dni, this.age, this.module, this.repeater);

  @override
  String toString() {
    return '$name $surnames ($age) - $dni: ${module.toString()} ($repeater)';
  }
}
