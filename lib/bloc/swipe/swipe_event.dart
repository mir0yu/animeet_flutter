part of 'swipe_bloc.dart';

abstract class SwipeEvent extends Equatable{
  const SwipeEvent();
  @override
  List<Object> get props => [];
}



class LoadUsers extends SwipeEvent {}

class SwipeLeft extends SwipeEvent {
  final MatchModel match;

  SwipeLeft({required this.match});

  @override
  List<Object> get props => [match];
}

class SwipeRight extends SwipeEvent {
  final MatchModel match;

  SwipeRight({required this.match});

  @override
  List<Object> get props => [match];
}
