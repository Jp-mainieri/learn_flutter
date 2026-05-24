class Aluno {
  final String name;
  final double notaFinal;

  const Aluno({required this.name, required this.notaFinal});
}

int contarAprovados(List<Aluno> alunos) {
  int aprovados = 0;
  for (final a in alunos) {
    if (a.notaFinal >= 6) {
      aprovados += 1;
    }
  }
  return aprovados;
}

void main() {
  Aluno a1 = Aluno(name: 'J', notaFinal: 9);
  print(contarAprovados([a1]));
}
