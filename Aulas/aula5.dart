class Pessoa {
  // Atributos:
  String nome;
  double altura;
  double? peso;
  String? dataNascimento; // Atributos opcionais: pode ser nulo.
  // Construtor:
  Pessoa(this.nome, this.altura);
  // Demais métodos:
  void printPessoa() {
    print('Nome: $nome');
    print('Altura: $altura');
    if (peso == null) {
      print('Peso: Não informado');
    } else {
      print('Peso: $peso');
    }
    if (dataNascimento == null) {
      print('Data de Nascimento: Não informada');
    } else {
      print('Data de Nascimento: $dataNascimento');
    }
  }
}

enum DiaSemana {
  segunda,
  terca,
  quarta,
  quinta,
  sexta,
  sabado,
  domingo
}

enum StatusLampada {
  ligado,
  desligado,
  offline
}

class Lampada {
  int id;
  String modelo;
  StatusLampada? status;
  Lampada(this.id, this.modelo);
}

void main() {
  Pessoa p = Pessoa('João Pedro', 1.90);
  p.printPessoa();
  var hoje = DiaSemana.segunda;
  print(hoje);
  if (hoje == DiaSemana.sabado || hoje == DiaSemana.domingo) {
    print('Descanso');
  }else{
    print('Trabalho');
  }

  Lampada lampada1 = Lampada(1, 'Modelo A');
  lampada1.status = StatusLampada.ligado;
  Lampada l2 = Lampada(2, 'Modelo B');
  l2.status = StatusLampada.offline;
  print(lampada1.status);
  print(l2.status);
}

// Construtor:
// É um metodo especial que define quais dados são inseridos no momento de criar a instância.
// O construtor é um método que tem o mesmo nome da classe
// Construtor é um endereçador.

// Para que serve um construtor?
// Para criar instancias com alguns dados imediatos;

// Ter um construtor não significa um objeto válido ideal. - posso construir uma instancia com dado lixo.
// O construtor não deve impedir a criação de um objeto real, mesmo que ele tenha lixo.

// ENUMs

// enumeration (lista enumerada)
// lista de valores constantes e fixos
// Uma lista enumerada serve para muitas coisas. A primeira é: quando eu tenho um conjunto fixo, que é muito dificil mudar, uso listas enumeradas.
// Exemplo: dias da semana, estados de um país.

// String Interning:

// 