//6 Investiga totes les accions que es poden utilitzar amb les llistes i fes un llistat amb
void main(List<String> arguments) {

var list = ['Pau', 'Malena', 'Luca'];

var copyList = List<String>.from(list);

list.add('Alicia');
print(list);

list.remove('Alicia');
print(list);

list.removeAt(0);
print(list);

list.removeLast();
print(list);

list.clear();
print(list);

list.addAll(copyList);
print(list);

list.forEach((element){
    if(element == 'Pau'){
      print(element);
    }
});

for(String element in list){
  if(element == 'Malena'){
    print(element);
  }
}

}