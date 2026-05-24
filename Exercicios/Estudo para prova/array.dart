void main() {
  List<double> array = [0, 1, 2, 3, 4, 5, 5, 4, 6, 5];

  printArray(array);
  print(somaTotalArray(array));
  print(mediaAritmetica(array));
  print(biggestLowestValue(array));
  print(invertArray(array));
  print(noDupesArray(array));
  print(sortArray(array));
  print(binarySearch(array, 5));
}

void printArray(List<dynamic> array) {
  for (int i = 0; i < array.length; i++) {
    print('$i: ${array[i]}');
  }
}

double somaTotalArray(List<double> array) {
  double soma = 0;
  for (double a in array) {
    soma += a;
  }
  return soma;
}

double mediaAritmetica(List<double> array) {
  double soma = somaTotalArray(array);
  return soma / array.length;
}

Map<String, dynamic> biggestLowestValue(List<double> array) {
  double big = 0;
  double low = double.infinity;

  for (double a in array) {
    if (a > big) {
      big = a;
    } else if (a < low) {
      low = a;
    }
  }
  return {'biggest': big, 'lowest': low};
}

List<double> invertArray(List<double> array) {
  List<double> iArray = [];
  for (int i = array.length - 1; i >= 0; i--) {
    iArray.add(array[i]);
  }
  return iArray;
}

List<double> noDupesArray(List<double> array) {
  List<double> nDArray = [];
  for (double a in array) {
    if (!nDArray.contains(a)) {
      nDArray.add(a);
    }
  }
  return nDArray;
}

List<double> sortArray(List<double> array) {
  if (array.isEmpty) return [];
  for (int i = 0; i < array.length - 1; i++) {
    for (int j = 0; j < array.length - i - 1; j++) {
      if (array[j] > array[j + 1]) {
        double temp = array[j + 1];
        array[j + 1] = array[j];
        array[j] = temp;
      }
    }
  }
  return array;
}

int? binarySearch(List<double> array, double searchValue) {
  if (array.isEmpty) return null;
  array = noDupesArray(array);
  array = sortArray(array);

  int low = 0;
  int high = array.length - 1;
  while (low <= high) {
    int md = (low + high) ~/ 2;
    double guess = array[md];
    if (searchValue == guess) {
      return md;
    }
    if (searchValue > guess) {
      low = md + 1;
    } else {
      high = md - 1;
    }
  }
  return null;
}
