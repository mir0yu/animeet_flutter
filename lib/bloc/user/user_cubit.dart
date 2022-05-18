import 'package:animeet/data/models/user.dart';
import 'package:animeet/data/services/user/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final UserRepository repository;

  UserCubit(this.repository) : super(UserInitial());
  void fetchUsers() async {
    emit(UsersLoading());
    final users = await repository.getUsers();

    if (users.isNotEmpty && users.first.error == null) {
        emit(UsersLoaded(users: users));
      } else {
        emit(UsersLoadingError());
      }
  }

  void getUser(String username) async {
    emit(GetUserLoading());
    final user = await repository.getUser(username);
    if (user != null) {
      emit(GetUserLoaded(user: user));
    } else {
      emit(UsersLoadingError());
    }
  }

  // void getSelfUser() async {
  //   emit(GetSelfUserLoading());
  //   if (user != null) {
  //     emit(GetSelfUserLoaded(selfUser: user));
  //   } else {
  //     emit(UsersLoadingError());
  //   }
  // }
}
