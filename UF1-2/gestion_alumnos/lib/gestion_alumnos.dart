import 'dart:math';
import 'package:gestion_alumnos/globals.dart';
import 'package:gestion_alumnos/module.dart';
import 'package:gestion_alumnos/student.dart';

List<Module> generateRandomModules() {
  var rng = Random();
  List<Module> randomModules = [];

  // Utilizing 'rng' from the 'math' library, we specify that the random number
  // generated must be between 0 and 6. By adding 1, the result will always be
  // greater than 0. This random number will determine the number of modules
  // assigned to each student.
  int numberOfModules = randomNumber();
  // 'For' loop: For each random number generated corresponding to numberOfModules,
  // a random module will be added at each respective position.
  // For instance, if numberOfModules is 2, a random module will be assigned
  // to position[0] and position[1].
  for (int i = 0; i < numberOfModules; i++) {
    Module randomModule = modules[rng.nextInt(modules.length)];

    // Conditional statement to prevent the assignment of duplicate random modules.
    if (!randomModules.contains(randomModule)) {
      randomModules.add(randomModule);
    }
  }

  return randomModules;
}

// This loop iterates through each student and assigns them unique random modules.
void assignModulesToStudents() {
  for (var student in students) {
    student.module = generateRandomModules();
  }
}

int randomNumber() {
  var rng = Random();
  int numberOfModules = rng.nextInt(6) + 1;
  return numberOfModules;
}

// Method to print the list of modules in the map.
String printModuleMap() {
  print('Lista original: ');
  return moduleMap.entries.map((entry) => '${entry.value}').join(', ');
}

// Method to print the sorted module list, displaying only the module numbers.
String ordenarModulos() {
  print('Lista ordenada: ');
  List<Module> sortedModules = moduleMap.values.toList();

  sortedModules.sort((a, b) =>
      extractNumberFromName(a.name).compareTo(extractNumberFromName(b.name)));

  return sortedModules.map((module) => module.toString()).join(', ');
}

int extractNumberFromName(String moduleName) {
  return int.parse(moduleName.substring(1));
}

void validarNumeroDeModulos(String studentName) {
  List<Student> allStudents = getAll();

  for (var student in allStudents) {
    String fullName = '${student.name} ${student.surnames}';

    // If the name entered in the console matches that of any student in the student list, ...
    if (fullName.toLowerCase() == studentName.toLowerCase()) {
      print("Información del estudiante: ${student.toString()}");

      int studentModuleLength = student.module.length;

      // If the length of the student's modules is 4 or more, the message "Curso completo" will be printed.
      // If the length is less than 4, the total length of the modules (the length of the map) minus 4 will be added.
      if (studentModuleLength >= 4) {
        print('Curso completo.');
      } else {
        int modulesToAdd = 4 - studentModuleLength;

        // Store all the modules that are not part of the student's enrolled modules.
        List<Module> availableModules = modules
            .where((module) => !student.module.contains(module))
            .toList();

        // Initialize an array for the new modules without any values.
        List<Module> newModules = [];

        var rng = Random();

        // Loop through the number of modules to add. If there are available modules,
        // randomly select a module from the availableModules list, remove it from the list,
        // and add it to both the newModules and the student's enrolled modules.
        for (int i = 0; i < modulesToAdd; i++) {
          if (availableModules.isNotEmpty) {
            Module randomModule = availableModules.removeAt(rng.nextInt(availableModules.length));
            newModules.add(randomModule);
            student.module.add(randomModule);
          }
        }

        print(
            "Información del estudiante con módulos actualizados: ${student.toString()}");
      }
      return;
    }
  }
}

bool buscarModulo(String? studentName, String? moduleName) {
  // If the student and module name are not null do the next thing
  if (studentName != null && moduleName != null) {
    List<Student> allStudents = getAll();

    // For each student in the students list, save the student to use for comparison in the next conditional.
    for (var student in allStudents) {
      String fullName = '${student.name} ${student.surnames}';

      if (fullName.toLowerCase() == studentName.toLowerCase()) {
        // If the student is the same, check if the module input matches any module in the student's module list.
        bool moduleExists =
            student.module.any((module) => module.name == moduleName);
        if (moduleExists) {
          print('El módulo $moduleName está asignado al estudiante $fullName.');
        } else {
          print(
              'El módulo $moduleName no está asignado al estudiante $fullName.');
        }
      }
    }

    print('Estudiante no encontrado.');
  } else {
    print('Nombre de estudiante o módulo no válido.');
  }

  return false;
}
