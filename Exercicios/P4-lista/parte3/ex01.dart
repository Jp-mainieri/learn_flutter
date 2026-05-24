int calcularMDC(int a, int b) {
  if (b == 0) return a;
  final int r = a % b;
  if (r == 0) return b;

  return calcularMDC(b, r);
}

int calcularMMC(int a, int b) {
  if (b == 0) throw ArgumentError('Denominador não pode ser igual a zero.');
  if (a == 0) throw ArgumentError('Dividendo não pode ser igual a zero.');
  b = b.abs();
  a = a.abs();
  final mmc = (a * b) / calcularMDC(a, b);
  return mmc.floor();
}

void main() {
  print(calcularMMC(2, 3));
  print(calcularMMC(4, 6));
  print(calcularMMC(8, 12));
  print(calcularMMC(-5, 10));
}
