import 'package:bloc/bloc.dart';

import 'package:carto/features/home/data/models/products_model.dart';
import 'package:carto/features/home/data/repo/home_repo.dart';
import 'package:meta/meta.dart';

part 'fetch_products_state.dart';

class FetchProductsCubit extends Cubit<FetchProductsState> {
  final HomeRepo _homeRepo;
  FetchProductsCubit(this._homeRepo) : super(FetchProductsInitial());
  

  void fetchProducts() async {
    emit(FetchProductsLoading());
    var response = await _homeRepo.fetchProducts();
    response.fold(
      (string) => emit(FetchProductsFailure(string)),
      (products) => emit(FetchProductsSuccess(products)),
      
      
    );
    
  }
  


}
