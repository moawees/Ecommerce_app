class CartModel {
  final String id;
  final List<CartItemModel> cartItems;
  final String userId;
  final double totalCartPrice;
  final DateTime createdAt;
  final DateTime updatedAt;

  CartModel({
    required this.id,
    required this.cartItems,
    required this.userId,
    required this.totalCartPrice,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json["_id"],
      cartItems: (json["cartItems"] as List)
          .map((item) => CartItemModel.fromJson(item))
          .toList(),
      userId: json["user"],
      totalCartPrice: (json["totalCartPrice"] as num).toDouble(),
      createdAt: DateTime.parse(json["createdAt"]),
      updatedAt: DateTime.parse(json["updatedAt"]),
    );
  }
}
class CartItemModel {
  final String productId;
  final int quantity;
  final double price;

  CartItemModel({
    required this.productId,
    required this.quantity,
    required this.price,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      productId: json["product"],
      quantity: json["quantity"],
      price: (json["price"] as num).toDouble(),
    );
  }
}