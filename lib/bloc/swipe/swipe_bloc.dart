import 'dart:convert';

import 'package:animeet/data/models/match.dart';
import 'package:animeet/data/models/user.dart';
import 'package:animeet/data/services/user/user_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'swipe_event.dart';
part 'swipe_state.dart';

class SwipeBloc extends Bloc<SwipeEvent, SwipeState> {
  final UserRepository repository;

  SwipeBloc(this.repository) : super(UsersLoading()) {
    on<LoadUsers>(_onLoadUsers);
    on<SwipeLeft>(_onSwipeLeft);
    on<SwipeRight>(_onSwipeRight);
  }

  void _onLoadUsers(
      LoadUsers event,
      Emitter<SwipeState> emit,
      ) async {
    {
      emit(UsersLoading());
      final users = await repository.getUsersForMatching();
      final selfUser = await repository.getUser('me');
      if (users.isNotEmpty && users.first.error == null && selfUser != null) {
        emit(UsersLoaded(users: users, selfUser: selfUser));
      } else {
        emit(UsersLoadingError());
      }
    }
  }



  void _onSwipeRight(
      SwipeRight event,
      Emitter<SwipeState> emit,
      ) {
    if (state is UsersLoaded) {
      final state = this.state as UsersLoaded;
      List<UserModel> users = List.from(state.users)..remove(event.match.receiver);
      repository.makeRequestForMatch(event.match);
      if (users.isNotEmpty) {
        emit(UsersLoaded(users: users, selfUser: state.selfUser));
      } else {
        emit(UsersLoadingError());
      }
    }
  }

  void _onSwipeLeft(
      SwipeLeft event,
      Emitter<SwipeState> emit,
      ) {
    if (state is UsersLoaded) {
      final state = this.state as UsersLoaded;
      List<UserModel> users = List.from(state.users)..remove(event.match.receiver);
      if (users.isNotEmpty) {
        emit(UsersLoaded(users: users,  selfUser: state.selfUser));
      } else {
        emit(UsersLoadingError());
      }
    }
  }


}
