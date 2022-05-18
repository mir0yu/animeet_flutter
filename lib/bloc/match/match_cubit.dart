import 'package:animeet/data/models/match.dart';
import 'package:animeet/data/models/user.dart';
import 'package:animeet/data/services/match/match_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'match_state.dart';

class MatchCubit extends Cubit<MatchState> {
  final MatchRepository repository;

  MatchCubit(this.repository) : super(MatchInitial());

  void fetchMatches() async {
    emit(MatchesLoading());
    final matches = await repository.getMatches();

    if (matches.isNotEmpty) {
      emit(MatchesLoaded(matches: matches));
    } else {
      emit(MatchesLoadingError());
    }
  }
}