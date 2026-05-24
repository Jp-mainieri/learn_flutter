Map<String, int> contarPalavras(List<String> palavras) {
  Map<String, int> contagemPalavras = {};
  for (final p in palavras) {
    if (contagemPalavras.containsKey(p)) {
      contagemPalavras[p] = contagemPalavras[p]! + 1;
    } else {
      contagemPalavras[p] = 1;
    }
  }
  return contagemPalavras;
}
