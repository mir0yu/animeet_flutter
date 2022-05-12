part of 'signUp_cubit.dart';


abstract class SignUpState {
  late SignUpModel data;
}

class SignUpInitial extends SignUpState {
  final SignUpModel data;

  SignUpInitial({required this.data});
}

class SignUpChanged extends SignUpState {
  final SignUpModel data;

  SignUpChanged({required this.data});
}

class UserSignUped extends SignUpState {}

class SignUpError extends SignUpState {
  final List<dynamic> errors;
  final SignUpModel data;

  SignUpError({required this.errors, required this.data});
}