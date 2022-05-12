import 'dart:convert';

import 'package:animeet/data/models/user.dart';
import 'package:animeet/data/services/user/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final UserRepository repository;

  UserCubit(this.repository) : super(UserInitial());
  void fetchUsers() {
    emit(UsersLoading());
    repository.getUsers().then((response) {
      if (response.statusCode == 200) {
        var rawUsers = jsonDecode(utf8.decode(response.bodyBytes));
        List<UserModel> users =
        rawUsers['results'].map<UserModel>((user) => UserModel.fromJson((user))).toList();
        emit(UsersLoaded(users: users));
      } else {
        emit(UsersLoadingError());
      }
    });
  }
  addUserToState(UserModel user) {
    final currentState = state;
    final users = currentState.users;
    users.add(user);
    emit(UsersLoaded(users: users));
  }
}
