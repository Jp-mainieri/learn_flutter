class Pessoa {
  final String nome;
  final double peso;
  final double altura;
  double? _imc;

  Pessoa(this.nome, this.peso, this.altura) {
    _calcularIMC();
  }

  void _calcularIMC(){
    this._imc = (this.peso / this.altura * this.altura);
  }

  double? get imc{
    return _imc;
  }
}
