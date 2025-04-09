import 'package:intl/intl.dart';

class TFormatter {
  static String formatDate(DateTime? date) {
    date ??= DateTime.now();
    return DateFormat('dd-MMM-yyyy').format(date); // Example: 10-Apr-2025
  }

  static String formatCurrency(double amount) {
    return NumberFormat.currency(locale: 'bn_BD', symbol: '৳').format(amount); // Example: ৳1,000.00
  }

  static String formatPhoneNumber(String phoneNumber) {
    // Remove all non-digit characters
    String digitsOnly = phoneNumber.replaceAll(RegExp(r'\D'), '');

    // Normalize to 11-digit format (local BD)
    if (digitsOnly.startsWith('880') && digitsOnly.length == 13) {
      digitsOnly = digitsOnly.substring(3); // Trim '880'
    }

    if (digitsOnly.length == 11 && digitsOnly.startsWith('01')) {
      return '${digitsOnly.substring(0, 3)}-${digitsOnly.substring(3, 6)}-${digitsOnly.substring(6)}';
    }

    return phoneNumber; // Invalid or unrecognized format
  }

  static String internationalFormatPhoneNumber(String phoneNumber) {
    String digitsOnly = phoneNumber.replaceAll(RegExp(r'\D'), '');

    if (digitsOnly.startsWith('880') && digitsOnly.length == 13) {
      digitsOnly = digitsOnly.substring(3);
    }

    if (digitsOnly.length == 11 && digitsOnly.startsWith('01')) {
      return '+880 ${digitsOnly.substring(0, 2)}-${digitsOnly.substring(2, 5)}-${digitsOnly.substring(5)}';
    }

    return phoneNumber; // Invalid format
  }
}
