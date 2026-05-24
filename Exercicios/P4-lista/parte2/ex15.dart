int factorial(int num) {
  int factorial = 1;
  if (num < 0) {
    throw ArgumentError('Numeros negativos não tem fatoriais');
  }
  for (int i = num; i > 0; i--) {
    factorial *= i;
  }
  return factorial;
}
