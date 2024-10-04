  double progressioA(double num1) {
    for (double i = 0; i <= num1; i++) {
      if (i % 2 == 0) {
        print(i);
      }
    }
    return 0;
  }

    double progressioB(double num2) {
    for (double i = num2; i >= 0; i--) {
      if (i % 2 != 0) {
        print(i);
      }
    }
    return 0;
  }

    double progressioC(double num1, double num2) {
    if (num1 > num2) {
      print(num1);
      return num1;
    } else {
      do {
        print(num1);
        num1++;
      } while (num1 <= num2);
      return num1;
    }
  }

void main(List<String> arguments) {
  //Programa exemple03.dart perquè al executar-se es declarin dues variables amb valors numèrics de tipus double superiors a 10 i seguidament:
  double num1 = 14.2;
  double num2 = 18.7;

  //a. Mostri la progressió numèrica dels números pars des de 0 fins el valor de la primera amb un bucle for.
  progressioA(num1);

  //b. Mostri la progressió numèrica des de la segona variable fins a 0 amb un bucle while.
  progressioB(num2);

  //c. Mostri la progressió numèrica des de la primera variable a la segona amb un bucle do/while. (Si la segona variable és més petita, només cal que imprimeix un cop el valor de la primera variable).
  progressioC(num1, num2);
}
