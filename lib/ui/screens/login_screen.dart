import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:animeet/bloc/login/login_cubit.dart';
import 'package:animeet/constants/paths.dart';
import 'package:animeet/ui/widgets/background.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var _controller = TextEditingController();
    // bool isPasswordVisible = false;
    return BlocListener<LogInCubit, LogInState>(
      listener: (context, state)
    {
      switch (state.runtimeType) {
        case LoggedIn:
          Navigator.pushNamedAndRemoveUntil(context, HOME, (r) => false);
          return;
        case LogInError:
          return;
      }
    },
      child: Scaffold(
        body: Stack(
          children: [
            const Background(),
            SafeArea(
              child: SingleChildScrollView(
                reverse: true,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                  child: Center(
                    child: Column(children: [
                      // if (!isKeyboard)
                      Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 50),
                            child: const Text(
                              'Animeet',
                              style: TextStyle(
                                color: Colors.black87,
                                // color: Color(0xff908FEC),
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                          margin: const EdgeInsets.only(top: 50),
                          width: 270,
                          child: TextField(
                            onChanged: (String value) async {
                              context.read<LogInCubit>().updatephoneNumber(value);
                            },
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16
                            ),
                            cursorColor: Colors.black54,
                            decoration: const InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black,
                                    width: 1.0,
                                    style: BorderStyle.solid),
                              ),
                              labelStyle: TextStyle(
                                color: Colors.black54,
                                // color: Color(0xff908FEC),
                                fontSize: 16,
                            ),
                              labelText: 'Номер телефона',
                            ),
                          )),
                      Container(
                          margin: const EdgeInsets.only(top: 25),
                          width: 270,
                          child: TextField(
                            onChanged: (String value) async {
                              context.read<LogInCubit>().updatePassword(value);
                            },
                            obscureText: true,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20),
                            cursorColor: Colors.black,
                            decoration: const InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black,
                                    width: 1.0,
                                    style: BorderStyle.solid),
                              ),
                              labelStyle: TextStyle(
                                  color: Colors.black54,
                                  // color: Color(0xff908FEC),
                                  fontSize: 16
                              ),
                              labelText: 'Пароль',
                            ),
                          )),
                      Container(
                        width: 270,
                        height: 50,
                        margin: const EdgeInsets.only(top: 70),
                        child: ElevatedButton(
                            child: const Text('Войти',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white
                                )),
                            onPressed: () async {
                              BlocProvider.of<LogInCubit>(context).loginUser(
                                  context.read<LogInCubit>().state.data);
                            },
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Colors.black),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    )))),
                      ),
                      Container(
                          margin: const EdgeInsets.only(top: 40),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, SIGNUP);
                            },
                            child: const Text('Создать аккаунт',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black87,
                                  // color: Color(0xff908FEC),
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                  decoration: TextDecoration.underline,
                                )),
                          )),
                    ]),
                  ),
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}