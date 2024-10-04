import 'package:gestion_alumnos/globals.dart';
import 'package:gestion_alumnos/module.dart';
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
