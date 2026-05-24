class Carrinho {
  final List<Produto> produtos = [];

  void adicionarAoCarrinho(Produto produto) {
    produtos.add(produto);
  }

  void exibirPrecoTotal() {
    double precoTotal = 0;
    for (final p in produtos) {
      precoTotal += p.preco;
    }
    print(precoTotal);
  }
}

class Produto {
  final String nome;
  final double preco;

  const Produto({required this.nome, required this.preco});
}

void main() {
  Produto p1 = Produto(nome: 'Budweiser 0', preco: 7.59);
  Produto p2 = Produto(nome: 'Budweiser', preco: 7.00);
  //Produto p3 = Produto(nome: 'Heineken', preco: 8.00);

  Carrinho carrinho = Carrinho();
  carrinho.adicionarAoCarrinho(p1);
  carrinho.adicionarAoCarrinho(p2);
  carrinho.adicionarAoCarrinho(p1);
  carrinho.adicionarAoCarrinho(p2);
  carrinho.exibirPrecoTotal();
}
