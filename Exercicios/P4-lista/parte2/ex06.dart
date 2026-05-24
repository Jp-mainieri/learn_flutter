String? maiorPalavra(List<String> palavras) {
  if (palavras.isEmpty) return null;
  List<String> listPalavra = [...palavras];
  listPalavra.sort((a, b) => a.length.compareTo(b.length));
  return listPalavra.last;
}
