void main(List<String> arguments) {
//4 Programa exemple04.dart perquè al executar-se :
//a. Crea una llista amb els següents números [15, 223, 334, 154, 99, 656].
var list = [15, 223, 334, 154, 99, 656];

//b. Mostri per pantalla els números que siguin parells.
      for (var i = 0; i < list.length; i++) {
        if(list[i] % 2 == 0){
          var parells = list[i];
          print('Número parell: $parells');
        }
      }

//c. Mostri per pantalla els números que siguin imparells.
      for (var i = 0; i < list.length; i++) {
        if(list[i] % 2 != 0){
          var imparells = list[i];
          print('Número imparell: $imparells');
        }
      }

}
