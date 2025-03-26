import 'package:intl/intl.dart';

class TFormatter {
  static String formatDate(DateTime? date) {
    date ??= DateTime.now();
    return DateFormat('dd-MMM-yyyy').format(date); // Example: 26-Mar-2025
  }

  static String formatCurrency(double amount) {
    return NumberFormat.currency(locale: 'bn_BD', symbol: '৳').format(amount); // Example: ৳1,000.00
  }

  static String formatPhoneNumber(String phoneNumber) {
    // Remove non-digit characters
    phoneNumber = phoneNumber.replaceAll(RegExp(r'\D'), '');

    if (phoneNumber.length == 11 && phoneNumber.startsWith('01')) {
      return '${phoneNumber.substring(0, 3)}-${phoneNumber.substring(3, 6)}-${phoneNumber.substring(6)}';
    }

    return phoneNumber; // Return as-is if not a valid BD number
  }

  static String internationalFormatPhoneNumber(String phoneNumber) {
    // Remove non-digit characters
    String digitsOnly = phoneNumber.replaceAll(RegExp(r'\D'), '');

    // Ensure it starts with BD country code
    if (digitsOnly.startsWith('880')) {
      digitsOnly = digitsOnly.substring(3); // Remove country code for formatting
    } else if (digitsOnly.startsWith('01')) {
      // Keep as local number
    } else {
      return phoneNumber; // Invalid BD number
    }

    // Format as international: +880 1X-XXX-XXXXX
    return '+880 ${digitsOnly.substring(0, 2)}-${digitsOnly.substring(2, 5)}-${digitsOnly.substring(5)}';
  }
}
