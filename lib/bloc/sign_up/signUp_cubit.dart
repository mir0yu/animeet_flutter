import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:animeet/data/models/sign_up.dart';
import 'package:animeet/data/services/sign_up/sign_up_repository.dart';


part 'signUp_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpRepository? repository;

  SignUpCubit(this.repository) : super(SignUpInitial(data: SignUpModel()));

  void updateUsername(String username) {
    final currentState = state;
    if (currentState is SignUpChanged || currentState is SignUpInitial) {
      emit(SignUpChanged(
          data: currentState.data.copyWith(username: username)));
    }
  }

  void updatePhoneNumber(String phoneNumber) {
    final currentState = state;
    if (currentState is SignUpChanged || currentState is SignUpInitial) {
      emit(SignUpChanged(data: currentState.data.copyWith(phoneNumber: phoneNumber)));
    }
  }

  void updatePassword(String password) {
    final currentState = state;
    if (currentState is SignUpChanged || currentState is SignUpInitial) {
      emit(SignUpChanged(
          data: currentState.data.copyWith(password: password)));
    }
  }

  void updatePassword2(String password2) {
    final currentState = state;
    if (currentState is SignUpChanged || currentState is SignUpInitial) {
      emit(SignUpChanged(
          data: currentState.data.copyWith(password2: password2)));
    }
  }

  void updateCode(String code) {
    final currentState = state;
    if (currentState is SignUpChanged || currentState is SignUpInitial) {
      emit(SignUpChanged(data: currentState.data.copyWith(code: code)));
    }
  }

  void signUpUser(SignUpModel data) {
    repository!
        .signUp(data.username!, data.phoneNumber!, data.password!, data.password2!, data.code!)
        .then((response) => {
      if (response.statusCode == 200 || response.statusCode == 201)
        {emit(UserSignUped())}
      else
        {
          emit(SignUpError(
              errors: [response.body], data: state.data.copyWith()))
        }
    });
  }

  void okWithError() {
    final currentState = state;
    emit(SignUpChanged(data: currentState.data.copyWith()));
  }
}