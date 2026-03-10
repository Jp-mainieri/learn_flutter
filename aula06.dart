// Passo 1 - Do tod0, para o detalhe:
// Quando precisamos analisar o código de algum projeto, começamos a ler este código, do tod0, para o detalhe:
// Entender o que cada pedaço faz. Não COMO ele faz.
// Passo 2 - Panorama de responsabilidades:
// Queremos saber o que cada classe faz, mesmo sem entender, a princípio, a lógica.

// Entender cada parte o que é, e como ela faz.

// Passo 3 - Executar o programa:
// Observar um programa pela execução dele, e em conjunto, ler código do ponto de entrada (main), pode facilitar o entendimento
// do conjunto tod0 (não das partes)

// LER. NÃO SUPOR.
// Quando lemos um código, não é um exercício de imaginação louca, é pura leitura.

// Ordem de análise: classes menores e menos complexas primeiro.
// Geralmente, classes menores, são as mais simples. Não necessariamente

// Treinar o métod0 substring -> String.substring(de, até)
// Treinar lambda functions
// Olhar metodos dos tipos (String, double...)
// O que é atributo privado
// O que é uma expressão regular

// Tudo que tem um . é um atributo
// Tudo que tem () são métodos

// Encadeamento de métodos, exemplo:

void chainingMethods() {
  String cidade = "campinas";
  cidade.replaceAll('a', 'A').replaceAll('p', 'P').replaceAll('s', 'r');
  print(cidade);
  // imprime campinas
  String nova = cidade.replaceAll('a', 'A').replaceAll('p', 'P').replaceAll('s', 'r');
  print(nova);
  //imprime cAmPinAr
}

void main() {
  chainingMethods();
}

// Tarefa:
// 1- ler o código conforme as dicas do professor.
// 2- Reescrever o código, estudando recursos novos enquanto escreve. Simulando a parte.
// Usar a aula 5 -> /aulas como fonte de estudos/referência.
// 3- Abrir um prompt (IA) e escrever:
// Professor nos deu este exemplo de calculadora muito simples em dart. Adapte para mim este exemplo num app Flutter
// que seja uma calculadora baseada neste código.
// 4- Interpretar o codigo do app Flutter que a IA enviou, Reescrever.