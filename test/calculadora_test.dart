import 'package:test/test.dart';
import '../exemploAulas/calculadora.dart';

void main() {
  test('add', () {
    final calc = CalculatorController();

    calc.press(Key(label: 'C', type: KeyType.action, action: CalcAction.clear));
    calc.press(Key(label: '2', type: KeyType.digit));
    calc.press(Key(label: '+', type: KeyType.operator, value: '+'));
    calc.press(Key(label: '2', type: KeyType.digit));
    calc.press(Key(label: 'Enter', type: KeyType.action, action: CalcAction.enter));

    expect(calc.display.text, '4');

    calc.press(Key(label: 'C', type: KeyType.action, action: CalcAction.clear));
    calc.press(Key(label: '2', type: KeyType.digit));
    calc.press(Key(label: '+', type: KeyType.operator, value: '+'));
    calc.press(Key(label: '2', type: KeyType.digit));
    calc.press(Key(label: '+', type: KeyType.operator, value: '+'));
    calc.press(Key(label: '2', type: KeyType.digit));
    calc.press(Key(label: 'Enter', type: KeyType.action, action: CalcAction.enter));

    expect(calc.display.text, 'Expressão inválida: \'2+2+2\'');
});

  test('subtract', () {
    final calc = CalculatorController();

    calc.press(Key(label: 'C', type: KeyType.action, action: CalcAction.clear));
    calc.press(Key(label: '2', type: KeyType.digit));
    calc.press(Key(label: '-', type: KeyType.operator, value: '-'));
    calc.press(Key(label: '2', type: KeyType.digit));
    calc.press(Key(label: 'Enter', type: KeyType.action, action: CalcAction.enter));

    expect(calc.display.text, '0');

  });

    test('multiply', () {
    final calc = CalculatorController();

    calc.press(Key(label: 'C', type: KeyType.action, action: CalcAction.clear));
    calc.press(Key(label: '2', type: KeyType.digit));
    calc.press(Key(label: 'x', type: KeyType.operator, value: '*'));
    calc.press(Key(label: '2', type: KeyType.digit));
    calc.press(Key(label: 'Enter', type: KeyType.action, action: CalcAction.enter));

    expect(calc.display.text, '4');

  });

      test('divide', () {
    final calc = CalculatorController();

    calc.press(Key(label: 'C', type: KeyType.action, action: CalcAction.clear));
    calc.press(Key(label: '2', type: KeyType.digit));
    calc.press(Key(label: '÷', type: KeyType.operator, value: '/'));
    calc.press(Key(label: '2', type: KeyType.digit));
    calc.press(Key(label: 'Enter', type: KeyType.action, action: CalcAction.enter));

    expect(calc.display.text, '1');

    calc.press(Key(label: 'C', type: KeyType.action, action: CalcAction.clear));
    calc.press(Key(label: '2', type: KeyType.digit));
    calc.press(Key(label: '÷', type: KeyType.operator, value: '/'));
    calc.press(Key(label: '0', type: KeyType.digit));
    calc.press(Key(label: 'Enter', type: KeyType.action, action: CalcAction.enter));

    expect(calc.display.text, 'Divisão por zero');

  });

      test('module', () {
    final calc = CalculatorController();

    calc.press(Key(label: 'C', type: KeyType.action, action: CalcAction.clear));
    calc.press(Key(label: '2', type: KeyType.digit));
    calc.press(Key(label: '%', type: KeyType.operator, value: '%'));
    calc.press(Key(label: '2', type: KeyType.digit));
    calc.press(Key(label: 'Enter', type: KeyType.action, action: CalcAction.enter));

    expect(calc.display.text, '0');

    calc.press(Key(label: 'C', type: KeyType.action, action: CalcAction.clear));
    calc.press(Key(label: '3', type: KeyType.digit));
    calc.press(Key(label: '%', type: KeyType.operator, value: '%'));
    calc.press(Key(label: '2', type: KeyType.digit));
    calc.press(Key(label: 'Enter', type: KeyType.action, action: CalcAction.enter));

    expect(calc.display.text, '1');

    calc.press(Key(label: 'C', type: KeyType.action, action: CalcAction.clear));
    calc.press(Key(label: '3', type: KeyType.digit));
    calc.press(Key(label: '%', type: KeyType.operator, value: '%'));
    calc.press(Key(label: '0', type: KeyType.digit));
    calc.press(Key(label: 'Enter', type: KeyType.action, action: CalcAction.enter));

    expect(calc.display.text, 'Módulo por zero');

  });
}