import 'array.dart';

void main() {
  List<int> toSort = [4, 2, 3, 6, 7];

  printArray(bubbleSort(toSort));
  print('----');
  printArray(selectionSort(toSort));
}

List<int> bubbleSort(List<int> array) {
  for (int i = 0; i < array.length - 1; i++) {
    bool trocou = false;
    for (int j = 0; j < array.length - i - 1; j++) {
      // bubule sort verifica se o atual é maior que o próximo
      if (array[j] > array[j + 1]) {
        int temp = array[j];
        array[j] = array[j + 1];
        array[j + 1] = temp;
        trocou = true;
      }
    }
    if (!trocou) break;
  }
  return array;
}

List<int> selectionSort(List<int> array) {
  for (int i = 0; i < array.length - 1; i++) {
    int lowestIndex = i;
    for (int j = i + 1; j < array.length; j++) {
      if (array[lowestIndex] > array[j]) {
        lowestIndex = j;
      }
    }
    if (lowestIndex != i) {
      int temp = array[i];
      array[i] = array[lowestIndex];
      array[lowestIndex] = temp;
    }
  }
  return array;
}
