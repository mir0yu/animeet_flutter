import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:animeet/ui/widgets/background.dart';
import 'package:animeet/bloc/authentication/authentication_cubit.dart';
import 'package:animeet/constants/paths.dart';

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        switch (state.runtimeType) {
          case AuthenticationSuccess:
            Navigator.pushNamedAndRemoveUntil(context, HOME, (r) => false);
          // const Center(child: Text("Auth success", style: TextStyle(color: Colors.black),),);
            return;
          case AuthenticationFailed:
            Navigator.pushNamedAndRemoveUntil(context, LOGIN, (r) => false);
            return;
        }
      },
      child: Scaffold(
        body: Stack(
          children: [
            const Background(),
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 50),
                child: BlocBuilder<AuthenticationCubit, AuthenticationState>(
                  builder: (context, state) {
                    if (state is AuthenticationChecking) {
                      return Center(
                        child: Column(
                          children: const [
                            Text(
                              'Animeet',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Center(child: CircularProgressIndicator())
                          ],
                        ),
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}