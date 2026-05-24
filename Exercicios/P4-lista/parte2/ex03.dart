List<int> getPares(List<int> numeros) {
  final List<int> pares = [];
  for (final n in numeros) {
    if (n % 2 == 0) {
      pares.add(n);
    }
  }
  return pares;
}
