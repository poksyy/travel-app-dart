  import 'dart:io';

  import 'package:gestion_alumnos/globals.dart';
  import 'package:gestion_alumnos/gestion_alumnos.dart';

  void main(List<String> arguments) {
    assignModulesToStudents();

    for (var student in students) {
      print(student.toString());
    }
    print('------------');

    print(printModuleMap());
    print(ordenarModulos());
    print('------------');

    print('¿Qué alumno quiere buscar?');
    String? studentName = stdin.readLineSync();
    validarNumeroDeModulos(studentName!);
    print('------------');

    print('¿Qué alumno quiere buscar?');
    String? student = stdin.readLineSync();
    print('¿Qué módulo quiere buscar?');
    String? module = stdin.readLineSync();
    buscarModulo(student, module);
    
  }

