class FormatTemp {
  final double temp;
  FormatTemp({required this.temp});
  int formatted() {
    int formattedTemp = (temp / 10).truncate();
    return formattedTemp;
  }
}
