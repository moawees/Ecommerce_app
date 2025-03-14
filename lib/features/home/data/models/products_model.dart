class Product {
  final String id;
  final String title;
  final String slug;
  final String description;
  final int quantity;
  final int sold;
  final double price;
  final List<String> colors;
  final String imageCover;
  final List<String> images;
  final String category;
  final int ratingsQuantity;
  final double ratingsAverage;

  Product({
    required this.id,
    required this.title,
    required this.slug,
    required this.description,
    required this.quantity,
    required this.sold,
    required this.price,
    required this.colors,
    required this.imageCover,
    required this.images,
    required this.category,
    required this.ratingsQuantity,
    required this.ratingsAverage,
  });

 factory Product.fromJson(Map<String, dynamic> json) {
  return Product(
    id: json['_id'] ?? '', // Provide a default empty string if null
    title: json['title'] ?? 'No Title',
    slug: json['slug'] ?? '',
    description: json['description'] ?? '',
    quantity: json['quantity'] ?? 0,
    sold: json['sold'] ?? 0,
    price: (json['price'] ?? 0).toDouble(),  // Default price to 0
    colors: json['colors'] != null ? List<String>.from(json['colors']) : [],
    imageCover: json['imageCover'] ?? '',
    images: json['images'] != null ? List<String>.from(json['images']) : [],
    category: json['category']?['name'] ?? 'Unknown Category',
    ratingsQuantity: json['ratingsQuantity'] ?? 0,
    ratingsAverage: (json['ratingsAverage'] ?? 0).toDouble(), // Default ratings to 0
  );
}



  static List<Product> parseProducts(dynamic responseBody) {
    return (responseBody['data'] as List)
        .map((json) => Product.fromJson(json))
        .toList();
  }
}
