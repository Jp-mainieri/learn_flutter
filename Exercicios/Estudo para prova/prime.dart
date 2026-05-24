import 'dart:io';
import 'array.dart';

void main() {
  print(isPrime(100));
  print(isPrime(1));
  print(isPrime(0));
  print(isPrime(4));
  print(isPrime(3));
  print(isPrime(13));
  print(isPrime(7));
  printPrimesToHundred();
  print(countPrimesToHundred());
  printArray(sieveOfErastotenes(50));
}

bool isPrime(int num) {
  if (num == 0 || num == 1) return false;
  bool isPrime = true;
  for (int d = 1; d <= num; d++) {
    if (d != 1 && d != num && num % d == 0) {
      isPrime = false;
    }
  }
  return isPrime;
}

void printPrimesToHundred() {
  for (int i = 0; i <= 100; i++) {
    if (isPrime(i)) {
      stdout.write('$i, ');
    }
  }
  print('');
}

int countPrimesToHundred() {
  int primesCount = 0;
  for (int i = 0; i <= 100; i++) {
    if (isPrime(i)) {
      primesCount++;
    }
  }
  return primesCount;
}

List<int> sieveOfErastotenes(int num) {
  if (num < 2) return [];

  List<bool> ehPrimo = List.filled(num + 2, true);
  ehPrimo[0] = false;
  ehPrimo[1] = false;
  for (int p = 2; p * p <= num; p++) {
    if (ehPrimo[p] == true) {
      for (int i = p * p; i <= num; i += p) {
        ehPrimo[i] = false;
      }
    }
  }

  List<int> primos = [];
  for (int p = 2; p <= num; p++) {
    if (ehPrimo[p]) {
      primos.add(p);
    }
  }
  return primos;
}
