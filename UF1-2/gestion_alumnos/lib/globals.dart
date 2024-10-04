import 'package:gestion_alumnos/module.dart';
import 'package:gestion_alumnos/student.dart';

Map<String, Module> moduleMap = {
  'module3': Module('M03', '3', '400'),
  'module4': Module('M04', '6', '35'),
  'module1': Module('M01', '2', '200'),
  'module2': Module('M02', '5', '90'),
  'module9': Module('M09', '4', '210'),
  'module11': Module('M11', '3', '175'),
  'module10': Module('M10', '5', '300')
};

List<Module> modules = [
  moduleMap['module3']!,
  moduleMap['module4']!,
  moduleMap['module1']!,
  moduleMap['module2']!,
  moduleMap['module9']!,
  moduleMap['module11']!,
  moduleMap['module10']!
];


List<Student> students = [
  student,
  student1,
  student2,
  student3,
  student4
];

Student student = Student('Vicente', 'Catalá Ruiz', '39988332D', 25, modules, 'repetidor');
Student student1 = Student('José', 'Martínez López', '12345678A', 20, modules, 'no repetidor');
Student student2 = Student('María', 'Gómez Pérez', '23456789B', 21, modules, 'repetidor');
Student student3 = Student('Carlos', 'Hernández Torres', '34567890C', 22, modules, 'no repetidor');
Student student4 = Student('Laura', 'Sánchez García', '45678901D', 23, modules, 'repetidor');

