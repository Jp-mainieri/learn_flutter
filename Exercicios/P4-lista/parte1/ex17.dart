class Tarefa {
  final String titulo;
  final String descricao;
  bool _concluida = false;

  Tarefa({required this.titulo, required this.descricao});

  void marcarComoConcluida() {
    _concluida = true;
  }

  bool get concluida => _concluida;
}
