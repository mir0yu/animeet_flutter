import 'package:bloc/bloc.dart';


import 'package:animeet/data/models/login.dart';
import 'package:animeet/data/services/login/login_repository.dart';

part 'login_state.dart';

class LogInCubit extends Cubit<LogInState> {
  final LoginRepository repository;
  LogInCubit(this.repository) : super(LogInInitial(data: LogInData()));

  void updatephoneNumber(String phoneNumber) {
    final currentState = state;
    if (currentState is LogInChanged || currentState is LogInInitial) {
      emit(LogInChanged(data: currentState.data.copyWith(phoneNumber: phoneNumber)));
    }
  }

  void updatePassword(String password) {
    final currentState = state;
    if (currentState is LogInChanged || currentState is LogInInitial) {
      emit(LogInChanged(data: currentState.data.copyWith(password: password)));
    }
  }

  void loginUser(LogInData data) {
    final currentState = state;
    repository.loginUser(data.phoneNumber, data.password).then((response) => {
      if (response.statusCode == 200 || response.statusCode == 201)
        {emit(LoggedIn())}
      else if (response.statusCode == 400)
        {emit(LogInError(data: currentState.data))}
    });
  }

  void okWithError() {
    final currentState = state;
    emit(LogInChanged(data: currentState.data));
  }
}