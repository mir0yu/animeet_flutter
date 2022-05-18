import 'package:animeet/bloc/login/login_cubit.dart';
import 'package:animeet/bloc/match/match_cubit.dart';
import 'package:animeet/bloc/sign_up/signUp_cubit.dart';
import 'package:animeet/bloc/swipe/swipe_bloc.dart';
import 'package:animeet/bloc/user/user_cubit.dart';
import 'package:animeet/data/services/login/login_repository.dart';
import 'package:animeet/data/services/match/match_repository.dart';
import 'package:animeet/data/services/sign_up/sign_up_repository.dart';
import 'package:animeet/data/services/user/user_repository.dart';
import 'package:animeet/ui/screens/home_screen.dart';
import 'package:animeet/ui/screens/login_screen.dart';
import 'package:animeet/ui/screens/signUp_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:animeet/constants/locator.dart';
import 'package:animeet/bloc/authentication/authentication_cubit.dart';
import 'package:animeet/data/services/authentication/auth_repository.dart';
import 'package:animeet/ui/screens/authentication_screen.dart';

import 'package:animeet/constants/paths.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AUTH:
        return CupertinoPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                AuthenticationCubit(getIt<AuthenticationRepository>())..auth(),
            child: const AuthenticationScreen(),
          ),
        );
      case LOGIN:
        return CupertinoPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => LogInCubit(getIt<LoginRepository>()),
            // child: const LogInPage(),
            child: const LogInPage(),
          ),
        );
      // case HOME:
      //   getIt.unSignUp<TweetCubit>();
      //   getIt.SignUpSingleton(TweetCubit(getIt<TweetRepository>()));
      //   getIt.unSignUp<CommentCubit>();
      //   getIt.SignUpSingleton(CommentCubit(getIt<CommentRepository>()));
      //   return CupertinoPageRoute(
      //       builder: (_) => MultiBlocProvider(
      //         providers: [
      //           BlocProvider(
      //             create: (context) => getIt<TweetCubit>()..fetchTweets(),
      //           ),
      //           BlocProvider(
      //             create: (context) => getIt<CommentCubit>(),
      //           ),
      //         ],
      //         child: const HomePage(),
      //       )
      //   );
      case SIGNUP:
        return CupertinoPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => SignUpCubit(getIt<SignUpRepository>()),
            child: const SignUpPage(),
          ),
        );
      case HOME:
        return CupertinoPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                  create: (context) => SwipeBloc(getIt<UserRepository>())),
              BlocProvider(
                create: (context) => UserCubit(getIt<UserRepository>()),
              ),
              BlocProvider(
                create: (context) => MatchCubit(getIt<MatchRepository>()),
              ),
            ],
            child: const HomePage(),
          ),
        );
      // case PROFILE:
      //   final String args = settings.arguments as String;
      //   return CupertinoPageRoute(
      //     builder: (_) => BlocProvider(
      //       create: (context) => UserCubit(getIt<UserRepository>()),
      //       child: ProfilePage(username: args,),
      //     ),
      //   );
      default:
        return null;
    }
  }
}
