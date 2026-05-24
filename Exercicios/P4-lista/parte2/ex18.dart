class Contato {
  final String nome;
  final String telefone;
  final String email;

  const Contato({
    required this.nome,
    required this.email,
    required this.telefone,
  });
}

Contato? searchByName(List<Contato> contatos, String nameToSearch) {
  if (nameToSearch.isEmpty) throw ArgumentError('Nenhum nome para procurar.');
  if (contatos.isEmpty) throw ArgumentError('Lista de contatos vazia.');
  for (final c in contatos) {
    if (c.nome == nameToSearch) {
      return c;
    }
  }
  print('Contato não encontrado');
  return null;
}
