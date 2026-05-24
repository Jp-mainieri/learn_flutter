import 'dart:collection';

class Pessoa {
  final String nome;

  Pessoa({required this.nome});
}

List<Pessoa> fila = [Pessoa(nome: 'J'), Pessoa(nome: 'L')];

void atenderFila(List<Pessoa> fila) {
  fila.removeAt(0);
}

void adicionarPessoaFila(List<Pessoa> fila, Pessoa p) {
  fila.add(p);
}

void exibirFila(List<Pessoa> fila) {
  fila.forEach(print);
}

void main() {
  Queue<Pessoa> queue = ListQueue();
  Pessoa p = Pessoa(nome: 'J');
  queue.add(p);
  queue.add(p);
  queue.add(p);
  queue.add(p);
  queue.removeFirst();
  print(queue);
}
