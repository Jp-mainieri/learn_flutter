// Uma classe que representa uma entidade do mundo real, dizemos que é uma "Entity class";

class Pessoa{ // A partir do momento que uma classe extende (é) uma outra, a classe que é a menos específica (Estudante extends Pessoa - Pessoa), é uma Super classe;
  String? nome;
  String? dataNascimento;
  double? peso;
  double? altura;
  void printData(){
    print(nome);
    print(dataNascimento);
    print(peso);
    print(altura);
  }
}

void printPessoa(Pessoa p){
  print(p.nome);
  print(p.dataNascimento);
  print(p.peso);
  print(p.altura);
}

class Estudante extends Pessoa {
  String? registroAcademico;
  @override // Pega a função printData e reescreve ela;
  void printData() { // Primeiro chama a funcão printData da superclasse e depois imprime o RA, tudo sem criar uma nova função;
    super.printData();
    print(registroAcademico);
  }
}

void main(){
  Pessoa p1 = Pessoa();
  p1.nome = 'João Pedro';
  p1.dataNascimento = '2006-10-31';
  p1.altura = 1.90;
  p1.peso = 66;

  Pessoa p2 = Pessoa();
  p2.nome = 'Luana';
  p2.dataNascimento = '2007-03-13';
  p2.altura = 1.74;
  p2.peso = 59;

  Pessoa p3 = Pessoa();
  p3.nome = 'João Pedro';
  p3.dataNascimento = '2006-10-31';
  p3.altura = 1.90;
  p3.peso = 66;

  p2 = p1; // Aqui o p2, aponta para o p1, o que faz com que sejam quase que "a mesma instancia";

  // Em linguagens orientadas a objetos o que é comparado de uma instancia é o conteúdo;
  // COMPARAR INSTANCIAS != COMPARAR CONTEÚDOS;

  if(p1 == p2){
    print('São iguais');
  }else{
    print('São diferentes');
  }

  if(p2 == p3){
    print('São iguais');
  }else{
    print('São diferentes');
  }

  printPessoa(p1);
  printPessoa(p2);
  printPessoa(p3);

  p1.printData();
  p2.printData();
  p3.printData();

  Estudante e1 = Estudante();
  e1.nome = 'Enrico';
  e1.dataNascimento = '2006-12-03';
  e1.altura = 1.76;
  e1.peso = 70;
  e1.registroAcademico = '25006642';

  printPessoa(e1); // Teria que criar outra função para imprimir o estutante completo;
  e1.printData();
}