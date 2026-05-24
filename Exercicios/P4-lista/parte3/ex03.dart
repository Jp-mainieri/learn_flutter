import 'dart:math';

double produtoEscalar(List<double> a, List<double> b) {
  double produtoEscalar = 0;
  for (int i = 0; i < a.length; i++) {
    produtoEscalar += a[i] * b[i];
  }
  return produtoEscalar;
}

double modulo(List<double> v) {
  double somaModulo = 0;
  for (int i = 0; i < v.length; i++) {
    somaModulo += v[i] * v[i];
  }
  if (somaModulo == 0) {
    throw ArgumentError('Modulo do Vetor não pode ser igual a zero.');
  }
  return sqrt(somaModulo);
}

double similaridade(List<double> a, List<double> b) {
  return produtoEscalar(a, b) / (modulo(a) * modulo(b));
}

double calcularSimilaridadeCosseno(List<double> a, List<double> b) {
  if (a.length != b.length) {
    throw ArgumentError('Vetores de tamanhos diferentes.');
  }
  return similaridade(a, b);
}

void main() {
  final textoA = [1.0, 2.0, 3.0];
  final textoB = [2.0, 4.0, 6.0];

  final similaridade = calcularSimilaridadeCosseno(textoA, textoB);

  print(similaridade);
}

//Valores muito proximos de 1.0 indicam muita similaridade por conta do angulo ficar muito proximo de 0, sendo assim o consseo é 0.
// 0.0 indicam pouca similaridade por conta do cosseno de 90 ser 0.
// -1.0 indicam direções opostas por conta do cosseno de 180 ser -1
