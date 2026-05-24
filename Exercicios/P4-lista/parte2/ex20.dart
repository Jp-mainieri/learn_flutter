// Agenda

// cadastrar contatos
// listar contatos
// buscar por nome
// remover contato

import 'ex18.dart';

class Agenda {
  final List<Contato> contatos = [];

  void cadastrarContato(Contato c) {
    contatos.add(c);
  }

  void listarContatos() {
    if (contatos.isEmpty) throw ArgumentError('Lista de contatos vazia.');
    contatos.forEach(print);
  }

  Contato? searchByName(String nameToSearch) {
    if (nameToSearch.trim().isEmpty)
      throw ArgumentError('Nenhum nome para procurar.');
    if (contatos.isEmpty) throw ArgumentError('Lista de contatos vazia.');
    for (final c in contatos) {
      if (c.nome == nameToSearch) {
        return c;
      }
    }
    print('Contato não encontrado');
    return null;
  }

  void removeContato(String nameToRemove) {
    if (contatos.isEmpty) throw ArgumentError('Lista de contatos vazia.');
    final c = searchByName(nameToRemove);
    if (c == null) throw ArgumentError('Contato não está cadastrado na agenda');
    contatos.remove(c);
  }
}
