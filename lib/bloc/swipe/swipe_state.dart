part of 'swipe_bloc.dart';

abstract class SwipeState extends Equatable{
  const SwipeState();
  @override
  List<Object> get props => [];
}

class UsersLoading extends SwipeState {}

class UsersLoaded extends SwipeState {
  final List<UserModel> users;
  final UserModel selfUser;

  UsersLoaded({required this.users, required this.selfUser});

  @override
  List<Object> get props => [users, selfUser];
}

class UsersLoadingError extends SwipeState {}