class Produto {
  String? nome;
  double? preco;
  String etiqueta(){
    return '$nome - R\$$preco';
  }
}
class Carrinho {
  List<Produto> listaProd = <Produto>[];
  void adicionar(Produto p){
    listaProd.add(p);
  }
  double total() {
    var total;
    for(final p in listaProd){
      total = total + p.preco;
    }
    return total;
  }
}
enum StatusPedido { aberto, pago, enviado, entregue }

void imprimirStatus(StatusPedido status) {
  switch(status){
    case StatusPedido.aberto:
      print('Status do pedido aberto, aguardando pagamento.');
      break;
    case StatusPedido.pago:
      print('Pagamento confirmado.');
      break;
    case StatusPedido.enviado:
      print('Pedido enviado.');
      break;
    case StatusPedido.entregue:
      print('Pedido entregue!');
      break;
  }
}

Future<String> buscarDados(){
  return Future.delayed(const Duration(seconds: 2), () => 'OK');
}

void main() {
  print('João Pedro');
  var a = 2, b = 3;
  int soma;
  soma = a + b;
  print(soma);
  var n = 6;
  if(n~/2 == 0){
    print('par');
  }else{
    print('impar');
  }
  var c = 5;
  if(a > b && a > c) {
    print('A é o maior');
  }else if(a < b && b > c){
    print('B é o maior');
    }else{
    print('C é o maior');
  }

  imprimirStatus(StatusPedido.pago);


}