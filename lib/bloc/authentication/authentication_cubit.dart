import 'package:animeet/data/services/user/user_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:animeet/data/services/authentication/auth_repository.dart';


part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  final AuthenticationRepository repository;
  AuthenticationCubit(this.repository) : super(AuthenticationInitial());

  void auth() {
    emit(AuthenticationChecking());
    repository.auth().then((response) => {
      if (response)
        {emit(AuthenticationSuccess())}
      else
        {emit(AuthenticationFailed())}
    });
  }

  // void getUser() {
  //   emit(GetUserChecking());
  //   userRepository.getUser('me').then((user) => {
  //     if (user != null)
  //       {emit(GetUserSuccess())}
  //     else
  //       {emit(GetUserFailed())}
  //   });
  // }
}