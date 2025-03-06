part of 'sign_up_cubit.dart';

@immutable
sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}
final class SignUpSuccess extends SignUpState {}
final class SignUpFailed extends SignUpState {
  final Failure error;

  SignUpFailed(this.error);
}
final class SignUpLoading extends SignUpState {}
