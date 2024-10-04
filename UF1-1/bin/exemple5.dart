import 'exemple1.dart' as practica1;

void main(List<String> arguments) {
//a. Concateni un text amb el resultat de l’operació de la activitat 1, del triangle A, però
//fent servir la concatenació amb el símbol +.
  print('L·área del triangle A és de ' + practica1.areaTriangle(2.25, 8.72).toString());

//b. Concateni un text amb el resultat de l’operació de la activitat 1, del triangle B, però
//fent servir la concatenació amb el símbol $
  print('L·área del triangle B és de ${practica1.areaTriangle(1.75, 5.43)}');
}

