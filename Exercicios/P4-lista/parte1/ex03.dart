bool ehPar(int num) {
  return num % 2 == 0 ? true : false;
}

void main() {
  print(ehPar(1));
  print(ehPar(2));
  print(ehPar(3));
  print(ehPar(4));
  print(ehPar(999));
}
