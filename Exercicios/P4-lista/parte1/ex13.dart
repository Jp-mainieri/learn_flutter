class Aluno {
  final String nome;
  final String matricula;
  final double notaFinal;

  const Aluno({
    required this.nome,
    required this.matricula,
    required this.notaFinal,
  });

  void printAlunoInfo() {
    print('Nome: $nome');
    print('Matricula: $matricula');
    print('Nota final: $notaFinal');
  }

  //Ex14
  bool estaAprovado() {
    return notaFinal >= 6;
  }
}

void main() {
  final Aluno a1 = Aluno(
    nome: 'João Pedro',
    matricula: '31/10/2006',
    notaFinal: 9.9,
  );
  final Aluno a2 = Aluno(nome: 'Luana', matricula: '13/03/2007', notaFinal: 10);

  a1.printAlunoInfo();
  a2.printAlunoInfo();
}
