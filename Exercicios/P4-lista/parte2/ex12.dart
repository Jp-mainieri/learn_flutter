class Nota {
  final double nota;

  const Nota({required this.nota});
}

List<Nota> removerNotasInvalidas(List<Nota> notas) {
  if (notas.isEmpty) return [];
  final List<Nota> notasValidas = [];
  for (final n in notas) {
    if (n.nota <= 10 && n.nota >= 0) notasValidas.add(n);
  }
  return notasValidas;
}
