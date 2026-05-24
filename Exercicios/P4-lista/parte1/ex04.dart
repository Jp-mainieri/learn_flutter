int maiorNum(int a, int b, int c) {
  if (a > b && a > c) {
    return a;
  } else if (b > a && b > c) {
    return b;
  }
  return c;
}

void main() {
  print(maiorNum(1, 2, 3));
  print(maiorNum(2, 4, 6));
  print(maiorNum(1, 8, 4));
}
