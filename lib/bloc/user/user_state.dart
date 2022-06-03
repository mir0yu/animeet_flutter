part of 'user_cubit.dart';

@immutable
abstract class UserState {
  late List<UserModel> users;
  late UserModel user;

}

class UserInitial extends UserState {}

class UsersLoading extends UserState {}

class UsersLoaded extends UserState {
  final List<UserModel> users;

  UsersLoaded({required this.users});
}

class GetUserLoading extends UserState {}

class GetUserLoaded extends UserState {
  final UserModel user;

  GetUserLoaded({required this.user});
}

class UsersLoadingError extends UserState {}


class UserUpdating extends UserState {}

class UserUpdated extends UserState {
  final UserModel user;

  UserUpdated({required this.user});
}

class UserUpdatingSuccess extends UserState {}

class UserUpdatingError extends UserState {}

