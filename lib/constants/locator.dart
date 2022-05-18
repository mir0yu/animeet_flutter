import 'package:animeet/bloc/authentication/authentication_cubit.dart';
import 'package:animeet/bloc/login/login_cubit.dart';
import 'package:animeet/bloc/match/match_cubit.dart';
import 'package:animeet/bloc/sign_up/signUp_cubit.dart';
import 'package:animeet/bloc/swipe/swipe_bloc.dart';
import 'package:animeet/bloc/user/user_cubit.dart';
import 'package:animeet/data/services/authentication/auth_api.dart';
import 'package:animeet/data/services/authentication/auth_repository.dart';
import 'package:animeet/data/services/login/login_api.dart';
import 'package:animeet/data/services/login/login_repository.dart';
import 'package:animeet/data/services/match/match_api.dart';
import 'package:animeet/data/services/match/match_repository.dart';
import 'package:animeet/data/services/sign_up/sign_up_api.dart';
import 'package:animeet/data/services/sign_up/sign_up_repository.dart';
import 'package:animeet/data/services/user/user_api.dart';
import 'package:animeet/data/services/user/user_repository.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupLocator() async {
  // LogIn
  getIt.registerSingleton(LoginNetworkService());
  getIt.registerSingleton(LoginRepository(getIt<LoginNetworkService>()));
  getIt.registerSingleton(LogInCubit(getIt<LoginRepository>()));

  // Authentication
  getIt.registerSingleton(AuthenticationNetworkService());
  getIt.registerSingleton(
      AuthenticationRepository(getIt<AuthenticationNetworkService>()));
  getIt.registerSingleton(
      AuthenticationCubit(getIt<AuthenticationRepository>()));
  //
  // Registration
  getIt.registerSingleton(SignUpNetworkService());
  getIt.registerSingleton(
      SignUpRepository(getIt<SignUpNetworkService>()));
  getIt.registerSingleton(
      SignUpCubit(getIt<SignUpRepository>()));
  //
  // User
  getIt.registerSingleton(UserNetworkService());
  getIt.registerSingleton(UserRepository(getIt<UserNetworkService>()));
  getIt.registerSingleton(UserCubit(getIt<UserRepository>()));


  getIt.registerSingleton(MatchNetworkService(getIt<UserNetworkService>()));
  getIt.registerSingleton(MatchRepository(getIt<MatchNetworkService>()));
  getIt.registerSingleton(MatchCubit(getIt<MatchRepository>()));

  getIt.registerSingleton(SwipeBloc(getIt<UserRepository>()));

  // // Create Project
  // getIt.registerSingleton(
  //     ProjectCreatingCubit(getIt<ProjectRepository>(), getIt<ProjectsCubit>()));

}