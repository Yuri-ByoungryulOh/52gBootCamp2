extension ParseNumbers on String {
  int toInt() => int.parse(this);
  double toDouble() => double.parse(this);
  bool isNumeric() => num.tryParse(this) != null;
}

extension E on String {
  String getFileExt() => split('.').last;
}
