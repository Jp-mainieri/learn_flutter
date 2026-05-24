import 'dart:io';

class Aluno {
  final String name;
  final String birthDate;
  final List<double> grades;
  double finalGrade;

  Aluno({
    required this.name,
    required this.birthDate,
    required this.grades,
    this.finalGrade = 0,
  }) {
    _mediaAritmetica();
  }

  void printAlunoInfo() {
    print('Nome: $name');
    print('Data de nascimento: $birthDate');
    print('Nota final: $finalGrade');
    _printAprovado();
  }

  void _mediaAritmetica() {
    double sum = 0;
    for (final n in grades) {
      sum += n;
    }
    finalGrade = sum / grades.length;
  }

  void _printAprovado() {
    if (finalGrade >= 6) {
      print('Aprovado!');
    } else if (finalGrade >= 4) {
      print('Recuperação');
    } else {
      print('Reprovado!');
    }
  }
}

void main() {
  print('Nota 1:');
  final String? n1 = stdin.readLineSync();
  print('Nota 2:');
  final String? n2 = stdin.readLineSync();
  print('Nota 3:');
  final String? n3 = stdin.readLineSync();
  final Aluno a1 = Aluno(
    name: 'João Pedro',
    birthDate: '31/10/2006',
    grades: [double.parse(n1!), double.parse(n2!), double.parse(n3!)],
  );

  a1.printAlunoInfo();
}
