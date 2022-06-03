// import 'package:animeet/bloc/user/user_cubit.dart';
// import 'package:animeet/data/models/user.dart';
// import 'package:animeet/data/services/user/user_repository.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// part 'updateUser_state.dart';
//
// class UpdateUserCubit extends Cubit<UpdateUserState> {
//   final UserRepository repository;
//   final UserCubit userCubit;
//   UpdateUserCubit(this.repository, this.userCubit)
//       : super(UpdateUserInitial());
//
//   void updateUsername(String username) {
//     final currentState = state;
//     if (currentState is UpdateUserDataChanged ||
//         currentState is UpdateUserInitial) {
//       emit(UpdateUserDataChanged(
//           user: currentState.user.copyWith(username: username)));
//     }
//   }
//
//   void updateFirstName(String firstName) {
//     final currentState = state;
//     if (currentState is UpdateUserDataChanged ||
//         currentState is UpdateUserInitial) {
//       emit(UpdateUserDataChanged(
//           user: currentState.user.copyWith(firstName: firstName)));
//     }
//   }
//
//   void updateLastName(String lastName) {
//     final currentState = state;
//     if (currentState is UpdateUserDataChanged ||
//         currentState is UpdateUserInitial) {
//       emit(UpdateUserDataChanged(
//           user: currentState.user.copyWith(lastName: lastName)));
//     }
//   }
//
//   void updateAvatar(String avatar) {
//     final currentState = state;
//     if (currentState is UpdateUserDataChanged ||
//         currentState is UpdateUserInitial) {
//       emit(UpdateUserDataChanged(
//           user: currentState.user.copyWith(avatar: avatar)));
//     }
//   }
//
//   void updateGender(String gender) {
//     final currentState = state;
//     if (currentState is UpdateUserDataChanged ||
//         currentState is UpdateUserInitial) {
//       emit(UpdateUserDataChanged(
//           user: currentState.user.copyWith(gender: gender)));
//     }
//   }
//
//   void updateBio(String description) {
//     final currentState = state;
//     if (currentState is UpdateUserDataChanged ||
//         currentState is UpdateUserInitial) {
//       emit(UpdateUserDataChanged(
//           user: currentState.user.copyWith(bio: description)));
//     }
//   }
//
//   void UpdateUser() {
//     final currentState = state;
//     emit(UpdatingUser());
//     repository.updateUser(state.user).then((response)) {
//       if (response.statusCode == 200) {
//         var User = jsonDe
//       }
//     }
//   }
//
//   // void UpdateUser(UserModel User) {
//   //   final currentState = state;
//   //   emit(UpdateUser());
//   //   repository.UpdateUser(task).then((response) {
//   //     if (response.statusCode == 200) {
//   //       var newTask = jsonDecode(response.body);
//   //       emit(UpdateUserSuccess());
//   //       emit(UpdateUserInitial());
//   //       taskCubit.UpdateUserToState(Task.fromJson(newTask));
//   //     } else if (response.statusCode == 400) {
//   //       emit(UpdateUserError(task: currentState.task));
//   //     }
//   //   });
//   // }
// }