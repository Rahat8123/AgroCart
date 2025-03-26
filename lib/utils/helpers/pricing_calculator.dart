class TPricingCalculator {
  /// -- Calculate Total Price (Product Price + VAT + Shipping)
  static double calculateTotalPrice(double productPrice, String location) {
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;
    double shippingCost = getShippingCost(location);

    double totalPrice = productPrice + taxAmount + shippingCost;
    return totalPrice;
  }

  /// -- Calculate Shipping Cost
  static String calculateShippingCost(double productPrice, String location) {
    double shippingCost = getShippingCost(location);
    return shippingCost.toStringAsFixed(2);
  }

  /// -- Calculate VAT
  static String calculateTax(double productPrice, String location) {
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;
    return taxAmount.toStringAsFixed(2);
  }

  /// -- Get VAT Rate for Bangladesh (15%)
  static double getTaxRateForLocation(String location) {
    return 0.15; // 15% VAT in Bangladesh
  }

  /// -- Get Shipping Cost Based on Location
  static double getShippingCost(String location) {
    switch (location.toLowerCase()) {
      case "dhaka":
        return 50.00; // Example: Tk 50 for Dhaka
      case "chattogram":
      case "other city":
        return 100.00; // Example: Tk 100 for other cities
      case "rural":
        return 150.00; // Example: Tk 150 for rural areas
      default:
        return 120.00; // Default shipping cost
    }
  }
}
