import 'package:carto/core/networking/api_consumer.dart';
import 'package:carto/features/home/data/models/products_model.dart';
import 'package:dartz/dartz.dart';

class HomeRepo {
  final ApiConsumer api;
  HomeRepo({
    required this.api,
  });
  Future<Either<String,List<Product>>> fetchProducts() async {
    try {
      final response = await api.get('product');
      final products = Product.parseProducts(response);
      return Right(products);
    } catch (e) {
      return Left(e.toString());
    }

    
  }

}
