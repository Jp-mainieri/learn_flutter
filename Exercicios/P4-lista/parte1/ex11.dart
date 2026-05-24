List<double> applyDiscount(List<double> precos) {
  final List<double> novosPrecos = [];

  for (double v in precos) {
    v = v * 0.9;
    novosPrecos.add(v);
    print('$v');
  }
  return novosPrecos;
}
