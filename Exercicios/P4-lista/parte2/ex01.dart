bool isPalindromo(String palavra) {
  final String iPalavra = palavra.split('').reversed.join();
  return iPalavra == palavra;
}
