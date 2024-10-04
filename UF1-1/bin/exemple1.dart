double areaTriangle(base, altura) {
  return ((base*altura)/2);
}
void main(List<String> arguments) {
  //a. Calculi l’àrea de dos triangles (A =[ base * altura] / 2) amb:
    //i. Triangle A: base 2.25 i altura 8.72.
    //ii. Triangle B: base 1.75 i altura 5.43.


    double areaA = areaTriangle(2.25, 8.72);
    double areaB = areaTriangle(1.75, 5.43);
  
  //b. Has de tenir en compte el tipus de les variables. En Dart hi han llibreries per consultar les variables que fan càlculs matemàtics (no és necessari instal·lar-les).
    //i. ¿Quina llibreria has fet servir?
    //ii. ¿Com la has inclòs en el teu codi?

  //c. Mostra per consola el valor de les dos àrees.
    print('Àrea triangle A: $areaA');
    print('Àrea triangle B: $areaB');

  //d. Suma les dues àrees i mostra el seu resultat.
    double areaSumaTotal(areaA, areaB){
      return (areaA + areaB);
    }
    print('Suma àrea total: ${areaSumaTotal(areaA, areaB)}');

}
