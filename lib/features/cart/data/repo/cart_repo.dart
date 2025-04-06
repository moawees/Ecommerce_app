import 'package:carto/core/networking/api_consumer.dart';
import 'package:carto/features/cart/data/model/cart_model.dart';
import 'package:carto/features/cart/data/model/cart_request_model.dart';
import 'package:dartz/dartz.dart';


class CartRepo {
  ApiConsumer api;
  CartRepo({
    required this.api,
  });
  

  Future addProductToCart({required String productId}) async {
    return await api.post(
      'cart',
      data: CartRequestModel(productId: productId).toJson(),
    );
  }


 
Future<Either<String, CartModel>> fetchCartItem() async {
  try {
    final response = await api.get('cart'); 

    if (response['status'] == 'success') {
      final cartData = response["data"] ;
      final cart = CartModel.fromJson(cartData);
      return Right(cart);
    } else {
      return Left('Failed to load cart: ${response['status']}');
    }
  } catch (e) {
    return Left('Error fetching cart: ${e.toString()}');
  }
}





}
