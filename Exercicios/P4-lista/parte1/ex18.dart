import 'ex17.dart';

void printNaoConlcuidas(List<Tarefa> tarefas) {
  for (final t in tarefas) {
    if (!t.concluida) print('${t.titulo} - ${t.descricao}');
  }
}
