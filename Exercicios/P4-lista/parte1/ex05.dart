List<int> saoPositivos(List<int> numbers) {
  List<int> positive = [];
  for (final n in numbers) {
    if (n > 0) positive.add(n);
  }
  return positive;
}

void main() {
  print(saoPositivos([1, 2, 3, 4, 5, -1, -2, -3, -4, -5]));
}
