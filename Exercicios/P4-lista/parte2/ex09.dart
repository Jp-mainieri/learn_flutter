List<int> diffBetweenLists(List<int> l1, List<int> l2) {
  if (l1.length != l2.length) {
    throw ArgumentError('As duas listas devem ter o mesmo tamanho');
  }
  final List<int> diff = [];
  for (int i = 0; i < l1.length; i++) {
    diff.add(l1[i] - l2[i]);
  }
  return diff;
}
