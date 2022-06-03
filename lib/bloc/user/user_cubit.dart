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

  void setUser(UserModel user) {
    emit(GetUserLoaded(user: user));
  }

  void userForUpdate(UserModel user) {
    emit(UserUpdated(user: user));
  }

  void updateUser(UserModel user) async {
    emit(UserUpdating());

    repository.updateUser(user).then((response) {
      if (response.statusCode == 200) {
        emit(UserUpdatingSuccess());
      } else {
        emit(UserUpdatingError());
      }
    });
  }


  void updateUsername(String username) {
    final currentState = state;
    if (currentState is UserUpdated) {
      emit(UserUpdated(
          user: currentState.user.copyWith(username: username)));
    }
  }

  void updateFirstName(String firstName) {
    final currentState = state;
    print(firstName);
    if (currentState is UserUpdated) {
      emit(UserUpdated(
          user: currentState.user.copyWith(firstName: firstName)));
    }
  }

  void updateLastName(String lastName) {
    final currentState = state;
    if (currentState is UserUpdated) {
      emit(UserUpdated(
          user: currentState.user.copyWith(lastName: lastName)));
    }
  }

  // void updateAvatar(String avatar) {
  //   final currentState = state;
  //   if (currentState is UserUpdated) {
  //     emit(UserUpdated(
  //         user: currentState.user.copyWith(avatar: avatar)));
  //   }
  // }

  void updateGender(String gender) {
    final currentState = state;
    if (currentState is UserUpdated) {
      emit(UserUpdated(
          user: currentState.user.copyWith(gender: gender)));
    }
  }

  void updateBio(String description) {
    final currentState = state;
    if (currentState is UserUpdated) {
      emit(UserUpdated(
          user: currentState.user.copyWith(bio: description)));
    }
  }
  void updateDateOfBirth(String dateOfBirth) {
    final currentState = state;
    final cur = currentState.user.dateOfBirth;
    final sta = state.user.dateOfBirth;
    print(" current $cur");
    print(" state $sta");
    if (currentState is UserUpdated) {
      emit(UserUpdated(
          user: currentState.user.copyWith(dateOfBirth: dateOfBirth)));
      final cur = currentState.user.dateOfBirth;
      final sta = state.user.dateOfBirth;
      print(" current $cur");
      print(" state $sta");

    }
  }

  // updateTaskInState(Task task) {
  //   var currentTasks = state.tasks;
  //   currentTasks.removeWhere((stateTask) => stateTask.id == task.id);
  //   currentTasks.add(task);
  //   emit(TaskUpdated(tasks: currentTasks));
  // }

  // void getSelfUser() async {
  //   emit(GetSelfUserLoading());
  //   if (user != null) {
  //     emit(GetSelfUserLoaded(selfUser: user));
  //   } else {
  //     emit(UsersLoadingError());
  //   }
  // }
}
