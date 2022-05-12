import 'dart:convert';

import 'package:animeet/data/models/user.dart';
import 'package:animeet/data/services/user/user_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'swipe_event.dart';
part 'swipe_state.dart';

class SwipeBloc extends Bloc<SwipeEvent, SwipeState> {
  final UserRepository repository;

  SwipeBloc(this.repository) : super(UsersLoading()) {
    on<LoadUsers>((event, emit) => {
          repository.getUsers().then((response) {
            if (response.statusCode == 200) {
              var rawUsers = jsonDecode(utf8.decode(response.bodyBytes));
              List<UserModel> users = rawUsers['results']
                  .map<UserModel>((user) => UserModel.fromJson((user)))
                  .toList();
              emit(UsersLoaded(users: users));
            } else {
              emit(UsersLoadingError());
            }
          })
        });
    on<SwipeLeft>((event, emit) => null);
    on<SwipeRight>((event, emit) => null);
  }
}
