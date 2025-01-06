import 'package:intl/intl.dart';

extension StringWithIndianComma on String {

  String withCommaAndDecimal() {
    if (this.isEmpty) return this;

    final number = double.tryParse(this);
    if (number == null) return this;

    // Indian numbering format (Lakhs, Crores)
    final formatter = NumberFormat.currency(
      locale: 'en_IN', // Indian locale
      symbol: '', // No currency symbol
      decimalDigits: 2, // Keep 2 decimal places
    );
    return formatter.format(number).trim();
  }

  String withDecimal() {
    if (this.isEmpty) return "0";

    final number = double.tryParse(this);
    if (number == null || number == 0) return "0";

    return number.toStringAsFixed(2);
  }

  String toIndianCurrency() {
    try {
      double value = double.parse(this);

      if (value >= 10000000) {
        return "${(value / 10000000).toStringAsFixed(2)} Cr";
      } else if (value >= 100000) {
        // Display in Lakhs even if the number is less than 1 lakh
        return "${(value / 100000).toStringAsFixed(2)} L";
      } else {
        return value.toString().withCommaAndDecimal();
      }
    } catch (e) {
      return this;
    }
  }

}

extension DateTimeFormatting on DateTime? {
  String formatDate() {
    if (this == null) return ''; // Handle null DateTime
    return DateFormat('dd/MM/yyyy').format(this!);
  }
}