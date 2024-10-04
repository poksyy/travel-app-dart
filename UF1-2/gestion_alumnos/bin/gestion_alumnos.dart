import 'dart:io';
import 'dart:math';

import 'package:gestion_alumnos/globals.dart';
import 'package:gestion_alumnos/module.dart';
import 'package:gestion_alumnos/gestion_alumnos.dart';
import 'package:gestion_alumnos/student.dart';

void main(List<String> arguments) {
  assignModulesToStudents();
  
  // Imprime todos los estudiantes
  for (var student in students) {
    print(student.toString());
  }

  print('------------');
  
  // Imprime los módulos
  print(printModuleMap());
  print(ordenarModulos());

  print('------------');

  print('¿Qué alumno quiere buscar?');
  
  String? studentName = stdin.readLineSync();
  validarNumeroDeModulos(studentName!);
}

String printModuleMap() {
  print('Lista original: ');
  return moduleMap.entries
      .map((entry) => '${entry.value}')
      .join(', ');
}

String ordenarModulos() {
  print('Lista ordenada: ');
  List<Module> sortedModules = moduleMap.values.toList();
  
  sortedModules.sort((a, b) => extractNumberFromName(a.name).compareTo(extractNumberFromName(b.name)));

  return sortedModules.map((module) => module.toString()).join(', ');
}

int extractNumberFromName(String moduleName) {
  return int.parse(moduleName.substring(1));
}

void validarNumeroDeModulos(String studentName) {
  List<Student> allStudents = getAll();
  
  for (var student in allStudents) {
    String fullName = '${student.name} ${student.surnames}';
    
    if (fullName.toLowerCase() == studentName.toLowerCase()) {
      print("Estudiante encontrado: ${student.toString()}");
      int studentModuleLength = student.module.length;
      if (studentModuleLength > 4 ){
        print('Curso completo');
      } else {
        var rng = Random();
        int randomModuleToAdd = rng.nextInt(6) + 1 - randomNumber();

        //TODO make this random int add to the modules length of the student  
        print(randomModuleToAdd);
      }
      return;
    }
  }

  print("Estudiante no encontrado.");
}
