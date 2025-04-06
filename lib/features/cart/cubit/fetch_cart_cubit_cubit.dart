import 'package:bloc/bloc.dart';
import 'package:carto/features/cart/data/model/cart_model.dart';
import 'package:carto/features/cart/data/repo/cart_repo.dart';
import 'package:meta/meta.dart';

part 'fetch_cart_cubit_state.dart';

class FetchCartCubit extends Cubit<FetchCartCubitState> {
  final CartRepo _cartRepo;
  FetchCartCubit(this._cartRepo) : super(FetchCartCubitInitial());
  void fetchCart() async {
    emit(FetchCartCubitLoading());
    final respons = await _cartRepo.fetchCartItem();
    respons.fold(
      (errorMessage) => emit(FetchCartCubitFailure(errorMessage)),
      (cart) {
        if (cart.cartItems.isEmpty) {
          emit(FetchCartCubitEmpty());
          return;
        }else{
          emit(FetchCartCubitSuccess(cart));

        }
        
      },
    );
  }
}
