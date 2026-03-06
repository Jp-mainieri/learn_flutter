//Orientação a objetos - Empresa logística de transportes

abstract class MeioTransporte {
  String? id;
  String? fabricante;
  String? modelo;
  String? capacidadeCarga;
  String? tipoCombustivel;
  void printMeioTransporte() {
    print('ID: $id');
    print('Fabricante: $fabricante');
    print('Modelo: $modelo');
    print('Capacidade de Carga: $capacidadeCarga');
    print('Tipo de Combustível: $tipoCombustivel');
  }
}

abstract class Terrestre extends MeioTransporte {
  String? placa;
  String chassi;
  String renavam;

  // Construtor que exige chassi e renavam e aceita placa opcional
  Terrestre(this.chassi, this.renavam, {this.placa});

  @override
  void printMeioTransporte() {
    super.printMeioTransporte();
    print('Placa: $placa');
    print('Chassi: $chassi');
    print('Renavam: $renavam');
  }
}

class Automovel extends Terrestre {
  String? numeroPortas;

  // o construtor recebe os parâmetros obrigatórios do pai e opcionalmente
  // o número de portas
  Automovel(String chassi, String renavam)
      : super(chassi, renavam);

  @override
  void printMeioTransporte() {
    super.printMeioTransporte();
    print('Número de Portas: $numeroPortas');
  }
}

class Motocicleta extends Terrestre {
  double? cilindradas;

  Motocicleta(String chassi, String renavam) :super(chassi,renavam);
    @override
  void printMeioTransporte() {
    super.printMeioTransporte();
    print('Cilindradas: $cilindradas');
  }
}

class Aeronave extends MeioTransporte {
  double? envergaduraAsas;
    @override
  void printMeioTransporte() {
    super.printMeioTransporte();
    print('Envergadura das Asas: $envergaduraAsas');
  }
}

class Embarcacao extends MeioTransporte {
  double? capacidadeContainers;
    @override
  void printMeioTransporte() {
    super.printMeioTransporte();
    print('Capacidade de Containers: $capacidadeContainers');
  }
}

// LIVRO: Arquitetura de computadores - memória