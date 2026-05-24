List<Map<String, dynamic>> precoMaior100(List<Map<String, dynamic>> produtos) {
  if (produtos.isEmpty) return [];
  final List<Map<String, dynamic>> precoMaior100 = [];
  for (final p in produtos) {
    if (p['preco'] > 100) {
      precoMaior100.add(p);
    }
  }
  return precoMaior100;
}
