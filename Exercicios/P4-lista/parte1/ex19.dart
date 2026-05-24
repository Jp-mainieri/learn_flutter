class Pedido {
  final int numero;
  final String cliente;
  final double valorTotal;

  const Pedido({
    required this.numero,
    required this.cliente,
    required this.valorTotal,
  });
}

Pedido? pedidoMaiorValor(List<Pedido> pedidos) {
  if (pedidos.isEmpty) return null;
  Pedido pedidoMaiorValor = pedidos.first;
  for (final p in pedidos) {
    if (p.valorTotal > pedidoMaiorValor.valorTotal) {
      pedidoMaiorValor = p;
    }
  }
  return pedidoMaiorValor;
}
