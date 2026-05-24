import 'ex01.dart';

class Fracao {
  final int numerador;
  final int denominador;

  Fracao({required this.numerador, required this.denominador})
    : assert(denominador != 0, 'O denominador não pode ser igual a zero');

  Fracao somar(Fracao f2) {
    final int novoDenominador = calcularMMC(denominador, f2.denominador);

    final novoNumerador =
        ((novoDenominador / denominador * numerador) +
        (novoDenominador / f2.denominador * f2.numerador));
    final Fracao resultado = Fracao(
      numerador: novoNumerador.floor(),
      denominador: novoDenominador,
    );
    return resultado;
  }

  void exibirFracao() {
    print('$numerador/$denominador');
  }
}

void main() {
  final f1 = Fracao(numerador: 1, denominador: 2);
  final f2 = Fracao(numerador: 1, denominador: 3);

  final resultado = f1.somar(f2);

  resultado.exibirFracao(); // 5/6
}
