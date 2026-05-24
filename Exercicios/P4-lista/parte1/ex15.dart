class Produto {
  final String nome;
  final double preco;
  final int quantidadeEmEstoque;

  const Produto({
    required this.nome,
    required this.preco,
    required this.quantidadeEmEstoque,
  });

  double valorTotalEmEstoque() {
    return preco * quantidadeEmEstoque;
  }
}
