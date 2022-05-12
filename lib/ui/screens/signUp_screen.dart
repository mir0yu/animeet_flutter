import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:animeet/constants/paths.dart';
import 'package:animeet/bloc/sign_up/signUp_cubit.dart';
import 'package:animeet/ui/widgets/background.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _controller = TextEditingController();
    return BlocListener<SignUpCubit, SignUpState>(
      listener: (context, state) {
        switch (state.runtimeType) {
          case UserSignUped:
            // showTopSnackBar(
            //   context,
            //   const SuccessSnackbar(info: "Вы успешно зарегистрировались!"),
            // );
            Navigator.pushNamed(context, LOGIN);
            return;
          case SignUpError:
            // showTopSnackBar(
            //   context,
          //     const ErrorSnackbar(info: "Попробуйте еще раз"));
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
                      child: Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                IconButton(
                                    icon: const Icon(
                                      Icons.arrow_back_ios_new_outlined,
                                      size: 20,
                                      color: Colors.black,
                                    ),
                                    onPressed: () => Navigator.pop(
                                        context)),

                                Container(
                                  margin: const EdgeInsets.only(top: 14),
                                  child: const Align(
                                    child: Text(
                                      'Регистрация',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                                margin: const EdgeInsets.only(top: 50),
                                width: 270,
                                child: TextField(
                                  controller: _controller,
                                  onChanged: (String value) {
                                    context
                                        .read<SignUpCubit>()
                                        .updateUsername(value);
                                  },
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 16),
                                  cursorColor: Colors.black,
                                  decoration: const InputDecoration(
                                    // suffixIcon: IconButton(
                                    //   icon: const Icon(Icons.clear, size: 16),
                                    //   color: Colors.black,
                                    //   onPressed: _controller.clear,
                                    // ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black,
                                          width: 1.0,
                                          style: BorderStyle.solid),
                                    ),
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                    ),
                                    labelText: 'Имя пользователя',
                                  ),
                                )),
                            Container(
                                margin: const EdgeInsets.only(top: 30),
                                width: 270,
                                child: TextField(
                                  onChanged: (String value) {
                                    context
                                        .read<SignUpCubit>()
                                        .updatePhoneNumber(value);
                                  },
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 16),
                                  cursorColor: Colors.black,
                                  decoration: const InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black,
                                          width: 1.0,
                                          style: BorderStyle.solid),
                                    ),
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                    ),
                                    labelText: 'Номер телефона',
                                  ),
                                )),
                            Container(
                                margin: const EdgeInsets.only(top: 25),
                                width: 270,
                                child: TextField(
                                  onChanged: (String value) {
                                    context
                                        .read<SignUpCubit>()
                                        .updatePassword(value);
                                  },
                                  obscureText: true,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 16),
                                  cursorColor: Colors.black,
                                  decoration: const InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black,
                                          width: 1.0,
                                          style: BorderStyle.solid),
                                    ),
                                    labelStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16),
                                    labelText: 'Пароль',
                                  ),
                                )),
                            Container(
                                margin: const EdgeInsets.only(top: 25),
                                width: 270,
                                child: TextField(
                                  onChanged: (String value) {
                                    context
                                        .read<SignUpCubit>()
                                        .updatePassword2(value);
                                  },
                                  obscureText: true,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 16),
                                  cursorColor: Colors.black,
                                  decoration: const InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black,
                                          width: 1.0,
                                          style: BorderStyle.solid),
                                    ),
                                    labelStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16),
                                    labelText: 'Еще раз пароль',
                                  ),
                                )),
                            Container(
                                margin: const EdgeInsets.only(top: 30),
                                width: 270,
                                child: TextField(
                                  onChanged: (String value) {
                                    context
                                        .read<SignUpCubit>()
                                        .updateCode(value);
                                  },
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 16),
                                  cursorColor: Colors.black,
                                  decoration: const InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black,
                                          width: 1.0,
                                          style: BorderStyle.solid),
                                    ),
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                    ),
                                    labelText: 'Code',
                                  ),
                                )),
                            Container(
                              width: 270,
                              height: 50,
                              margin: const EdgeInsets.only(top: 40),
                              child: ElevatedButton(
                                  child: const Text('Продолжить',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white
                                      )),
                                  onPressed: () async {
                                    BlocProvider.of<SignUpCubit>(context)
                                        .signUpUser(context
                                        .read<SignUpCubit>()
                                        .state
                                        .data);
                                  },
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all(Colors.black),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(15),
                                          )))),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}