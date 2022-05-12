part of 'swipe_bloc.dart';

abstract class SwipeEvent extends Equatable{
  const SwipeEvent();
  @override
  List<Object> get props => [];
}

class LoadUsers extends SwipeEvent {
  final List<UserModel> users;

  LoadUsers({required this.users});

  @override
  List<Object> get props => [users];
}

class SwipeLeft extends SwipeEvent {
  final UserModel user;

  SwipeLeft({required this.user});

  @override
  List<Object> get props => [user];
}

class SwipeRight extends SwipeEvent {
  final UserModel user;

  SwipeRight({required this.user});

  @override
  List<Object> get props => [user];
}
