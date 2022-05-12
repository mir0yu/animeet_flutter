part of 'user_cubit.dart';

@immutable
abstract class UserState {
  late List<UserModel> users;
}

class UserInitial extends UserState {}

//! User load states
class UsersLoading extends UserState {}

class UsersLoaded extends UserState {
  final List<UserModel> users;

  UsersLoaded({required this.users});
}

class UsersLoadingError extends UserState {}