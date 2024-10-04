import 'dart:math';
import 'package:gestion_alumnos/globals.dart';
import 'package:gestion_alumnos/module.dart';

List<Module> generateRandomModules() {
  var rng = Random();
  List<Module> randomModules = [];

  // using 'rng' from 'math', we specify that the random number must be between 0 and 6, but with '+1' it will always be greater than 0. This random number will be used for the number of modules for each student.
  int numberOfModules = randomNumber();  
  // 'for' loop. For each random number generated with numberOfModules, a random module will be added at each position.
  // for example if numberOfModules is '2' give a random number for position[0] and position[1].
  for (int i = 0; i < numberOfModules; i++) {
    Module randomModule = modules[rng.nextInt(modules.length)];
    

    if (!randomModules.contains(randomModule)) {
      randomModules.add(randomModule);
    }
  }

  return randomModules;
}

// loops through each student and assigns them random modules.
void assignModulesToStudents() {
  for (var student in students) {
    student.module = generateRandomModules();
  }
}

int randomNumber(){
  var rng = Random();
  int numberOfModules = rng.nextInt(6) + 1;
  return numberOfModules;
}