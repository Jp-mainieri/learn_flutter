List<String>? ordenarAlfabetica(List<String> nomes) {
  if (nomes.isEmpty) return null;
  List<String> listNomes = [...nomes];
  listNomes.sort();
  return listNomes;
}
