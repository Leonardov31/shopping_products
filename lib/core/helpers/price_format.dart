class PriceFormat {
  static formatToString(double value) {
    String stringValue = value.toStringAsFixed(2);
    stringValue = stringValue.replaceFirst('.', ',');

    return stringValue;
  }

  static toDouble(String value) {
    if (value.isNotEmpty) {
      value = value.replaceAll(RegExp(r"\s+"), "");
      value = value.replaceFirst(',', '.');

      return double.parse(value);
    }

    return 0;
  }
}
