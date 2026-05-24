class ContaBancaria {
  double _saldo = 0;
  final String titular;

  ContaBancaria({required this.titular});

  void depositar(double valor) {
    _saldo += valor;
  }

  void sacar(double valor) {
    if (valor <= _saldo) {
      _saldo -= valor;
    } else {
      print('O valor inserido para o saque é maior que o saldo atual');
    }
  }

  void exibirSaldo() {
    print(_saldo);
  }

  double get saldo => _saldo;
}
