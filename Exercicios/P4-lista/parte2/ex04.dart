int? segundoMaior(List<int> numeros) {
  if (numeros.length < 2) return null;
  int maior = numeros.first;
  int? segundoMaior;

  for (final n in numeros) {
    if (n > maior) {
      segundoMaior = maior;
      maior = n;
    } else if (segundoMaior != null) {
      if (n < maior && n > segundoMaior) {
        segundoMaior = n;
      }
    } else if (n < maior) {
      segundoMaior = n;
    }
  }
  return segundoMaior;
}

int? segundoMaiorV2(List<int> numeros) {
  List<int> listNumeros = [...numeros];
  listNumeros = listNumeros.toSet().toList();
  listNumeros.sort();
  if (listNumeros.length < 2) return null;
  listNumeros.removeLast();
  return listNumeros.last;
}
