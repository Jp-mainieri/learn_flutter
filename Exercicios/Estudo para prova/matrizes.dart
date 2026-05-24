import 'dart:io';

void main() {
  List<List<double>> A = [
    //2 cols e 3 rows
    [0, 1],
    [2, 3],
    [4, 5],
  ];
  List<List<double>> B = [
    //3 cols e 2 rows
    [0, 3, 5],
    [1, 2, 4],
  ];
  List<List<double>> C = [
    //3 cols e 2 rows
    [1, 2, 4],
    [1, 2, 4],
    [1, 2, 4],
  ];
  printMatrix(A);
  print(somarTotalMatriz(A));
  printMatrix(transposeMatrix(A));
  print('-Multiply--');
  printMatrix(multiplyMatrix(A, B));
  print(diagonalSum(C));
}

List<List<double>> matrix = [[]];

void printMatrix(List<List<double>> matrix) {
  for (int i = 0; i < matrix.length; i++) {
    for (int j = 0; j < matrix[0].length; j++) {
      stdout.write('${matrix[i][j]} ');
    }
    stdout.write('\n');
  }
}

double somarTotalMatriz(List<List<double>> matrix) {
  double sum = 0;
  for (List r in matrix) {
    for (double c in r) {
      sum += c;
    }
  }
  return sum;
}

List<List<double>> transposeMatrix(List<List<double>> matrix) {
  int rows = matrix.length;
  int cols = matrix[0].length;
  List<List<double>> tMatrix = List.generate(
    cols,
    (_) => List<double>.filled(rows, matrix[0][0]),
  );
  for (int r = 0; r < rows; r++) {
    for (int c = 0; c < cols; c++) {
      tMatrix[c][r] = matrix[r][c];
    }
  }
  return tMatrix;
}

List<List<double>> multiplyMatrix(
  List<List<double>> matrixA,
  List<List<double>> matrixB,
) {
  int rowsA = matrixA.length;
  int colsA = matrixA[0].length;
  int rowsB = matrixB.length;
  int colsB = matrixB[0].length;

  //Verify if matrixes are compatible
  // Is compatible = nColunasA == nLinhasB
  if (colsA != rowsB) throw Exception('Multiplicação impossível');

  List<List<double>> resultMatrix = List.generate(
    rowsA,
    (_) => List.filled(colsB, 0),
  );

  for (int i = 0; i < rowsA; i++) {
    for (int j = 0; j < colsB; j++) {
      for (int k = 0; k < colsA; k++) {
        resultMatrix[i][j] += matrixA[i][k] * matrixB[k][j];
      }
    }
  }
  return resultMatrix;
}

Map<String, dynamic> diagonalSum(List<List<double>> matrix) {
  if (matrix.isEmpty) throw Exception('Matriz vazia');
  if (matrix.length != matrix[0].length) {
    throw Exception('Matriz tem que ser quadrada');
  }
  double principalDiagonalSum = 0;
  double secondaryDiagonalSum = 0;
  for (int i = 0; i < matrix.length; i++) {
    for (int j = 0; j < matrix[0].length; j++) {
      if (i == j) {
        principalDiagonalSum += matrix[i][j];
      }
      if (matrix.length - i - 1 == j) {
        secondaryDiagonalSum += matrix[i][j];
      }
    }
  }
  return {
    'Soma diagonal principal': principalDiagonalSum,
    'Soma diagonal secundária': secondaryDiagonalSum,
  };
}
