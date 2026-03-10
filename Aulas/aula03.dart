//Dart é orientada a objetos -> classes

//Forma do ovo de páscoa é uma CLASSE
//O ovo real é uma instância

//Uma instância pode ser composta por outras instâncias de outras classes

//Classe:
// Especificação formal de um objeto.
// Possui a definição de atributos e comportamentos.
//Instância:
// É a realização (tornar real) um objeto.

//class Estudante
//  nome
//  ra
//  email
//  cursos
//  telefone

//class Professor
//  nome
//  email
//  endereço
//  data de nascimento
//  telefone

//class Pessoa
//  nome
//  data de nascimento
//  altura
//  peso

/*class Person {
  String name;
  Date birthDate;
  double weigth;
  double height;
}

class Student extends Person { // extends = Herança: herda da "superclasse" características e comportamentos.
  String academicRegister;
  List<String> corses;
  List<String> contacts;
  Address address;
}

class Address { // Classes geralmente começam com a letra maiúscula
  String street;
  int number;
  String complement;
  String cep;
  enum uf = { sp, mg, mt, ms, am, pn, sc };
}
// Endereco e = new     *java*
// e.street = "Rua bourdeaux";
// e.number = 75;
// e.cep = 13105844;
// e.uf =

class Teacher extends Person {

} // Exercício para casa: Definir algumas classes no seguinte contexto: Padaria

// UML = unified model language

// Classe (Pessoa) -> Atributos (String nome, Date dataNascimento...) | Comportamentos (Funções+métodos)
//           ^ (é uma/herda)
// Classe (Estudante) -> Atributos (String registroAcademico...) | Comportamentos

class Ball {
  double diameter;
  double weight;

  move(origem, destino, modo){
    //...
  };
}

class jogador{
  //...
  kick(Ball b){
    b.move(origem, destino, modo);
  };
}

//class para calculadora
*/