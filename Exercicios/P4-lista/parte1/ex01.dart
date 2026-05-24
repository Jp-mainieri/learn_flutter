class Aluno {
  final String name;
  final String birthDate;
  final double finalGrade;

  const Aluno({
    required this.name,
    required this.birthDate,
    required this.finalGrade,
  });

  void printAlunoInfo() {
    print('Nome: $name');
    print('Data de nascimento: $birthDate');
    print('Nota final: $finalGrade');
  }
}

void main() {
  final Aluno a1 = Aluno(
    name: 'João Pedro',
    birthDate: '31/10/2006',
    finalGrade: 9.9,
  );

  a1.printAlunoInfo();
}
