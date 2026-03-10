abstract class Animal { // Padrão de especificação abstrato, ela obriga a classe que herda dela, a ter o comportamento complementar; NÃO VAI SER INSTANCIADA;
  void show(){
    print('Tocar musica... tambores...');
  }
  void hide(){
    print('Puuff...');
  }
}
class Dog extends Animal{
  void bark() {
    print('Au Au.');
  }
  @override
  void show() {
    super.show();
    print('Cachorro chega caminhando...');
  }
}
class Cat extends Animal{
  void meow() {
    print('Miaaaaaaau...');
  }
  @override
  void show(){
    super.show();
    print('Gato chega pelos galhos das árvores...');
  }
}

class Duck extends Animal {
  void quack() {
    print("Quack... Quack...");
  }
  @override
  void show(){
    super.show();
    print('Pato chega nadando pelo lago...');
  }
}

class Horse extends Animal {
  void Relincho() {
    print("Pocotó... Pocotó...");
  }
  @override
  void show(){
    print('Som de cavalaria...');
    print('Cavalo entra galopando...');
  }
}

void main (){
  print('JOGO INICIADO');

}

// Classe pato e cavalo, cavalo quando aparece vem som de cavalaria, APENAS;
