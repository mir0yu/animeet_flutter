part of 'match_cubit.dart';

abstract class MatchState {
  late List<UserModel> matches;
}

class MatchInitial extends MatchState {}

class MatchesLoading extends MatchState {}

class MatchesLoaded extends MatchState {
  final List<UserModel> matches;

  MatchesLoaded({required this.matches});
}
class MatchesLoadingError extends MatchState {}