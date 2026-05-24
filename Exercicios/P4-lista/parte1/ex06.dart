int sumNumbers(List<int> numbers) {
  int sum = 0;
  for (final n in numbers) {
    sum += n;
  }
  return sum;
}

//Ex 7
double calcularMedia(List<int> numbers) {
  return sumNumbers(numbers) / numbers.length;
}

void main() {
  print(sumNumbers([1, 2, 3, 4, 5, -1, -2, -3, -4, -5, 1]));
  print(calcularMedia([1, 2, 3, 4, 5, -1, -2, -3, -4, -5, 1]));
}
