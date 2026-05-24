int qtdVogais(String palavra) {
  const String vogais = 'aeiou';
  final List<String> letras = palavra.toLowerCase().split('');
  int qtdVogal = 0;
  for (final l in letras) {
    if (vogais.contains(l)) {
      qtdVogal += 1;
    }
  }
  return qtdVogal;
}
