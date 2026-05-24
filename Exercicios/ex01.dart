int multiplicacao(int a, int b) {
  return a * b;
}

bool aprovado(var nota) {
  bool aprovado;
  if (nota >= 6) {
    aprovado = true;
    if (nota >= 8) {
      print('ÓTIMO');
      return aprovado;
    }
    print('APROVADO');
  } else {
    print('REPROVADO');
    aprovado = false;
  }
  return aprovado;
}

void printlista(var lista) {
  for (final f in lista) {
    print(f);
  }
}

int countLista(var lista) {
  var count = 0;
  lista.forEach({count++});
  return count;
}

void main() {
  var nome = 'João Pedro';
  var idade = 19;
  final frutas = ['banana', 'maça', 'abacaxi', 'mamão'];
  final aluno = {
    'nome': 'João Pedro',
    'ra': '25006642',
    'curso': 'Engenharia de Software',
    'turma': 102,
  };

  String?
  apelido; //String? existe para se a variavel for null, não ter erro no programa por não ser do tipo esperado, que é string.
  print(apelido);
  apelido = 'Mainieri';
  print(apelido);

  print(aluno['nome']);
  print(aluno['ra']);
  print(aluno['curso']);
  print(aluno['turma']);
  printlista(frutas);
  print(countLista(frutas));
  print('$nome tem $idade anos');
  print(multiplicacao(10, 5));
  print(aprovado(8));
}
