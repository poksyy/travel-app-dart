void main(List<String> arguments) {
  // a. Mostri una progressió numèrica dels números impars des de 100 fins a 50, has d’utilitzar el bucle for.
  int progressioA(int num1, int num2) {
    for (int i = num1; i >= num2; i--) {
      if (i % 2 != 0) {
        print(i);
      }
    }
    return 0;
  }
  progressioA(100, 50);

  // b. Mostri una progressió numèrica dels números entre 20 i 50, quan sigui par ha de mostrar el missatge “El número es par”. Has d’utilitzar el bucle while.
  int progressioB(int num1, int num2){
  while(num1 <= num2){
    if (num1 % 2 == 0){
      print('El número es $num1 par.');
    }
    num1++;
    }
    return 0;
  }
  progressioB(20, 50);

}