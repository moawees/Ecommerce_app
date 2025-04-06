part of 'fetch_cart_cubit_cubit.dart';

@immutable
sealed class FetchCartCubitState {}

final class FetchCartCubitInitial extends FetchCartCubitState {}
final class FetchCartCubitLoading extends FetchCartCubitState {}
final class FetchCartCubitSuccess extends FetchCartCubitState {
  final CartModel cart;

  FetchCartCubitSuccess( this.cart);

  
}
final class FetchCartCubitFailure extends FetchCartCubitState {
  final String message;

  FetchCartCubitFailure(this.message);
}
final class FetchCartCubitEmpty extends FetchCartCubitState {}
