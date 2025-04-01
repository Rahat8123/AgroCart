class BrandModel {
  final String name;
  final String image;
  final int? productsCount;

  BrandModel({
    required this.name,
    required this.image,
    this.productsCount,
  });

  // Optional: Factory constructor for creating an instance from JSON
  factory BrandModel.fromJson(Map<String, dynamic> json) {
    return BrandModel(
      name: json['name'] as String,
      image: json['image'] as String,
      productsCount: json['productsCount'] as int?,
    );
  }
}
