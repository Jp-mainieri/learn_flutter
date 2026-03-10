// Aula: 
// Objetivo: Desenhar uma arquitetura simples de uma calculadora (Dart puro).
// Aprender conceitos como nomeação de atributos com _ (padrão dart para atributos privados).
// Conhecer e aplicar (ainda sem saber como construir) expressões regulares. 
// Entender construtores mais complexos. 
// Uso de const e final. 

// Conceitos exemplificados:
// 1) final -> referências imutáveis (boas práticas de design)
// 2) enum -> tipagem literal (evita strings e melhora desempenho de comparação)
//
// Regras desta versão:
// - Uma expressão por vez: "a op b"
// - Ex.: 2x2 + Enter -> calcula imediatamente
// - Operadores: +, -, *, /, x
// - Ações: C (clear), ⌫ (backspace), Enter (calcular)

/// Enum = tipagem literal: conjunto fechado de valores para representar tipos de teclas
/// Tipo de Tecla: Uma tecla nesta versão da calculadora, só pode ser digito, operador ou ação.
enum KeyType { digit, operator, action } // R: Enum é melhor do que strings, porque não precisa pesquisar entre as strings, evita erros de digitação e tem strings pré-definidas.

/// Enum para ações da calculadora (melhor que comparar strings como "Enter").
/// Ações especiais da calculadora o que ela deve fazer em determinadas ações especiais. 
enum CalcAction { clear, backspace, enter }

/// Classe que representa uma tecla.
/// Criaremos com `const Key(...)` diretamente.
class Key {
  /// `final` -> depois que o objeto nasce, esses valores não mudam.
  final String label;
  final KeyType type;

  /// value pode ser diferente do label (ex.: label "×" mas value "x")
  final String? value;

  /// action só é usado quando type == KeyType.action
  final CalcAction? action; // R: Os atributos foram declarados como final porque não devem mudar depois de criados

  /// Construtor const:
  /// - permite criar objetos imutáveis (quando todos os campos também forem imutáveis)
  /// - ajuda a reforçar a ideia de "tecla como valor"
  const Key({ // R: O construtor foi declarado como const para permitir a criação de objetos que não mudam depois de criados
    required this.label, // R: O Label é o nome da key, e o valor é o que ela representa. Ex: label = "x", value = "*".
    required this.type,  
    this.value,
    this.action,
  });
}

/// Display: cuida apenas do texto exibido.
/// Separação de responsabilidade: display NÃO calcula.
class Display {

  // "ATRIBUTO PRIVADO" (tem efeito real mas, não como o private do Java). 
  String _text; // R: O _ em _text significa que este é um atributo privado, que não deve ser acessado fora da classe
  // R: Os metodos que alteram _text são setText, clear, append e backspace.
  // Deixar o atributo privado ajuda a garantir que o estado de display não seja alteradp de forma indevida fora da classe.
  /// Construtor define o estado inicial do display.
  Display({String initialText = ""}) : _text = initialText;

  String get text => _text;

  void setText(String value) => _text = value;

  void clear() => _text = "";

  void append(String value) => _text += value;

  void backspace() {
    if (_text.isEmpty) return;
    _text = _text.substring(0, _text.length - 1);
  }
}

/// Motor de cálculo: recebe a expressão como String e devolve o resultado.
///
/// Nesta versão: apenas "a op b" (uma expressão por vez)
/// Ex.: "10/5", "3.5*2", "-2+7"
class CalculatorEngine {
  double evaluate(String expression) {
    final exp = _normalize(expression);

    // Regex para: numero operador numero
    // - aceita sinal opcional (+/-)
    // - aceita decimal com ponto
    final regex = RegExp(
      r'^\s*([+-]?\d+(?:\.\d+)?)\s*([+\-*/x%])\s*([+-]?\d+(?:\.\d+)?)\s*$', // Os formatos que a regex aceita são: N+N, N-N, N*N, N/N, NxN, onde N pode ser um número inteiro ou decimal, e pode ter um sinal opcional de + ou - no início. A regex também permite espaços em branco antes, entre e depois dos números e do operador.
    ); // 2+2+2 Não funciona nesta regex porque ela so aceita uma operação por vez.

    final match = regex.firstMatch(exp);
    if (match == null) {
      throw FormatException("Expressão inválida: '$expression'");
    }

    final a = double.parse(match.group(1)!);
    final op = match.group(2)!;
    final b = double.parse(match.group(3)!);

    return _apply(a, op, b);
  }

  String _normalize(String s) {
    // Normaliza '×' e 'X' para 'x'
    return s.replaceAll('×', 'x').replaceAll('X', 'x').trim();
  }

  double _apply(double a, String op, double b) {
    switch (op) {
      case '+':
        return a + b;
      case '-':
        return a - b;
      case '*':
      case 'x':
        return a * b;
      case '/':
        if (b == 0) throw UnsupportedError("Divisão por zero");
        return a / b;
      case '%':
        if (b == 0) throw UnsupportedError("Módulo por zero");
        return a % b;
      default:
        throw UnsupportedError("Operador não suportado ou inexistente: $op");
    }
  }
}

/// Controller: recebe teclas e orquestra display + engine.
class CalculatorController {
  /// `final` é perfeito aqui:
  /// - display e engine são dependências fixas do controller
  /// - a referência não muda (o conteúdo do display pode mudar)
  final Display display;
  final CalculatorEngine engine;

  /// Construtor com injeção de dependência (didático):
  /// Se não passar nada, cria padrões.
  CalculatorController({Display? display, CalculatorEngine? engine})
      : display = display ?? Display(),
        engine = engine ?? CalculatorEngine();

  void press(Key key) {
    switch (key.type) {
      case KeyType.digit:
      case KeyType.operator:
        // Para dígito ou operador: apenas anexa ao display.
        // Se tiver `value`, usa ele; senão usa o `label`.
        display.append(key.value ?? key.label);
        break;

      case KeyType.action:
        _handleAction(key.action);
        break;
    }
  }

  void _handleAction(CalcAction? action) {
    if (action == null) return;

    switch (action) {
      case CalcAction.clear:
        display.clear();
        break;
      case CalcAction.backspace:
        display.backspace();
        break;
      case CalcAction.enter:
        _compute();
        break;
    }
  }

  void _compute() {
    final input = display.text.trim();
    if (input.isEmpty) return;

    try {
      final result = engine.evaluate(input);

      // Se for inteiro, mostra sem ".0"
      final intCandidate = result.toInt();
      final formatted = (result == intCandidate) ? "$intCandidate" : "$result";

      display.setText(formatted);
    }on UnsupportedError catch (e) {
      display.setText("${e.message}");
    }on FormatException catch (e) {
      display.setText("${e.message}");
    } catch (_) { // Quando a expressão é inválida, o try vai dar erro, ao tentar chamar o engine.evaluate(input). E então o catch vai registrar o erro no display.
      display.setText("Erro");
    }
  }
}

/// Demonstração no console:
/// simula apertar teclas como numa calculadora.
void main() {
  final calc = CalculatorController();

  // Simulação: 2 x 2 Enter
  final keys1 = <Key>[
    const Key(label: "2", type: KeyType.digit),
    const Key(label: "x", type: KeyType.operator, value: "x"),
    const Key(label: "2", type: KeyType.digit),
    const Key(label: "Enter", type: KeyType.action, action: CalcAction.enter),
  ];

  //1. Usuario pressiona 2 (Keytype.digit) press(key);
  //2. Controller chama display.append("2");
  //3. Display atualiza seu estado interno: "2";
  //4. Usuario pressiona x (KeyType.operator) press(key);
  //5. Controller chama display.append("x");
  //6. Display atualiza seu estado interno: "2x";
  //7. Usuario pressiona 2 (KeyType.digit) press(key);
  //8. Controller chama display.append("2");
  //9. Display atualiza seu estado interno: "2x2";
  //10. Usuario pressiona Enter (KeyType.action) press(key);
  //11.Controller chama _handleAction(CalcAction.enter);
  //12. _handleAction() chama _compute();
  //13. _compute() chama display.setText("4") -> resultado;
  //14. Display atualiza seu estado interno: "4";

  for (final k in keys1) {
    calc.press(k);
    print("Apertou '${k.label}' -> display: ${calc.display.text}");
  }

  print("\n--- Outro exemplo: 10/5 ---");
  calc.press(const Key(label: "C", type: KeyType.action, action: CalcAction.clear));
  calc.press(const Key(label: "1", type: KeyType.digit));
  calc.press(const Key(label: "0", type: KeyType.digit));
  calc.press(const Key(label: "/", type: KeyType.operator, value: "/"));
  calc.press(const Key(label: "5", type: KeyType.digit));
  calc.press(const Key(label: "Enter", type: KeyType.action, action: CalcAction.enter));
  print("Resultado: ${calc.display.text}");

  print("\n--- Erro: 2/0 ---");
  calc.press(const Key(label: "C", type: KeyType.action, action: CalcAction.clear));
  calc.press(const Key(label: "2", type: KeyType.digit));
  calc.press(const Key(label: "/", type: KeyType.operator, value: "/"));
  calc.press(const Key(label: "0", type: KeyType.digit));
  calc.press(const Key(label: "Enter", type: KeyType.action, action: CalcAction.enter));
  print("Resultado: ${calc.display.text}");

  print("\n--- Outro exemplo: 3%2 ---");
  calc.press(const Key(label: "C", type: KeyType.action, action: CalcAction.clear));
  calc.press(const Key(label: "3", type: KeyType.digit));
  calc.press(const Key(label: "%", type: KeyType.operator, value: "%"));
  calc.press(const Key(label: "%", type: KeyType.digit));
  calc.press(const Key(label: "Enter", type: KeyType.action, action: CalcAction.enter));
  print("Resultado: ${calc.display.text}");

  print("\n--- Outro exemplo: 3.5*2 ---");
  calc.press(const Key(label: "C", type: KeyType.action, action: CalcAction.clear));
  calc.press(const Key(label: "3", type: KeyType.digit));
  calc.press(const Key(label: ".", type: KeyType.operator, value: "."));
  calc.press(const Key(label: "5", type: KeyType.digit));
  calc.press(const Key(label: "*", type: KeyType.operator, value: "x"));
  calc.press(const Key(label: "2", type: KeyType.digit));
  calc.press(const Key(label: "Enter", type: KeyType.action, action: CalcAction.enter));
  print("Resultado: ${calc.display.text}");
}