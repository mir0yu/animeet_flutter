part of 'swipe_bloc.dart';

abstract class SwipeState extends Equatable{
  const SwipeState();
  @override
  List<Object> get props => [];
}

class UsersLoading extends SwipeState {}

class UsersLoaded extends SwipeState {
  final List<UserModel> users;

  UsersLoaded({required this.users});

  @override
  List<Object> get props => [users];
}

class UsersLoadingError extends SwipeState {}