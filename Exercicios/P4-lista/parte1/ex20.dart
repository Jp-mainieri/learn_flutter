import 'ex13.dart';

class AlunosCadastrados {
  List<Aluno> listaAlunos = [];

  void cadastrarAluno(Aluno aluno) {
    listaAlunos.add(aluno);
  }

  void listarAlunos() {
    if (listaAlunos.isEmpty) {
      print('Nenhum aluno cadastrado');
      return;
    }

    for (final a in listaAlunos) {
      a.printAlunoInfo();
    }
  }

  void listarAlunosAprovados() {
    if (listaAlunos.isEmpty) {
      print('Nenhum aluno cadastrado');
      return;
    }
    bool algumAprovado = false;
    for (final a in listaAlunos) {
      if (a.estaAprovado()) {
        algumAprovado = true;
        a.printAlunoInfo();
      }
    }
    if (!algumAprovado) print('Nenhum aluno aprovado');
  }
}
