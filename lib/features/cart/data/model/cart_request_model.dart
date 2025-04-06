class CartRequestModel{
  String productId;
  CartRequestModel({
    required this.productId,
  });
  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
    };
  }
}