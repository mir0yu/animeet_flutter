part of 'authentication_cubit.dart';

@immutable
abstract class AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationChecking extends AuthenticationState {}

class AuthenticationSuccess extends AuthenticationState {}

class AuthenticationFailed extends AuthenticationState {}

class GetUserChecking extends AuthenticationState {}

class GetUserSuccess extends AuthenticationState {}

class GetUserFailed extends AuthenticationState {}