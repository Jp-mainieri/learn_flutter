void nomesMaior5(List<String> nomes) {
  for (final n in nomes) {
    if (n.length > 5) {
      print(n);
    }
  }
}

void main() {
  nomesMaior5(['João Pedro', 'Matheus', 'Caio', 'Paulo']);
}
