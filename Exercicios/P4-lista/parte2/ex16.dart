List<int> fibonacciUntil(int u) {
  if (u == 0) return [];
  if (u == 1) return [0];
  final List<int> fibonacci = [0, 1];
  for (int i = 2; i < u; i++) {
    fibonacci.add(fibonacci[i - 1] + fibonacci[i - 2]);
  }
  return fibonacci;
}

List<int> fibonacciUntilRecusive(int u) {
  if (u == 0) return [];
  if (u == 1) return [0];
  if (u == 2) return [0, 1];
  List<int> lista = fibonacciUntilRecusive(u - 1);
  lista.add(lista.last + lista[lista.length - 2]);
  return lista;
}
