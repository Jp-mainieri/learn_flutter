void printDate(String date) // dd/mm/aa
{
  List<String> splittedDate = date.split('/');
  if (splittedDate.length == 3) {
    splittedDate.forEach(print);
  } else {
    throw ArgumentError('Formato da data inserida é inválido');
  }
}
