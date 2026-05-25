import 'dart:math';

double calcularErroMedioQuadratico(
  List<double> valoresReais,
  List<double> valoresPrevistos,
) {
  //
  if (valoresReais.length != valoresPrevistos.length) {
    throw ArgumentError('Os tamanhos das listas devem ser iguais.');
  }
  if (valoresReais.isEmpty || valoresPrevistos.isEmpty) {
    throw ArgumentError('Nenhuma lista pode estar vazia.');
  }
  //
  double mediaSquaredDiffValores = 0;
  for (int i = 0; i < valoresReais.length; i++) {
    mediaSquaredDiffValores += pow(
      valoresReais[i] - valoresPrevistos[i],
      2,
    ).toDouble();
  }
  return mediaSquaredDiffValores / valoresReais.length;
}

void main() {
  final valoresReais = [10.0, 20.0, 30.0];
  final valoresPrevistos = [12.0, 18.0, 33.0];

  final mse = calcularErroMedioQuadratico(valoresReais, valoresPrevistos);

  print(mse); // 5.666...
}

// Elevar ao quadrado evita que erros positivos e negativos se anulem, deixando a diferença concreta.
