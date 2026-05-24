class Livro {
  final String titulo;
  final String autor;
  final int anoDePublicacaoo;

  const Livro({
    required this.anoDePublicacaoo,
    required this.autor,
    required this.titulo,
  });
}

List<Livro> livrosAPartir2020(List<Livro> livros) {
  return livros.where((l) => l.anoDePublicacaoo > 2020).toList();
}
