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
  final List<double> diffValores = [];
  for (int i = 0; i < valoresReais.length; i++) {
    diffValores.add(valoresReais[i] - valoresPrevistos[i]);
  }
  //
  final List<double> squaredDiffValores = [];
  for (int i = 0; i < diffValores.length; i++) {
    squaredDiffValores.add((pow(diffValores[i], 2)).toDouble());
  }
  //
  double mediaSquaredDiffValores = 0;
  for (int i = 0; i < squaredDiffValores.length; i++) {
    mediaSquaredDiffValores += squaredDiffValores[i];
  }
  return mediaSquaredDiffValores / squaredDiffValores.length;
}

void main() {
  final valoresReais = [10.0, 20.0, 30.0];
  final valoresPrevistos = [12.0, 18.0, 33.0];

  final mse = calcularErroMedioQuadratico(valoresReais, valoresPrevistos);

  print(mse); // 5.666...
}
