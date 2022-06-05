import 'dart:io';

import 'package:animeet/bloc/user/user_cubit.dart';
import 'package:animeet/constants/paths.dart';
import 'package:animeet/data/models/user.dart';
import 'package:animeet/ui/widgets/snackbars/error_widget.dart';
import 'package:animeet/ui/widgets/snackbars/success_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class UpdateUserScreen extends StatefulWidget {
  UserModel user;
  UpdateUserScreen({Key? key, required this.user}) : super(key: key);

  @override
  State<UpdateUserScreen> createState() => _UpdateUserScreenState();
}

class _UpdateUserScreenState extends State<UpdateUserScreen> {
  DateTime selectedDate = DateTime.now();
  late String year = "Год";
  late String month = "Месяц";
  late String day = "День";

  final ImagePicker _picker = ImagePicker();

  File? image;

  @override
  void initState() {
    BlocProvider.of<UserCubit>(context).userForUpdate(widget.user);
    super.initState();
  }


  Future pickImage() async {
    try {
      final XFile? imageTemp = await _picker.pickImage(source: ImageSource.gallery);

      if (imageTemp == null) return;


      setState(() {
        image = File(imageTemp.path);
        print(image!.path);
      });

    } on PlatformException catch(e) {
      showTopSnackBar(
        context,
        const ErrorSnackbar(info: "Не удалось загрузить картинку"),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // bottomOpacity: 0.5,
        centerTitle: true,
        title: const Text(
        "Изменить профиль",
        style: TextStyle(
        color: Colors.red,
        fontSize: 22,
        fontWeight: FontWeight.bold,
        fontFamily: 'Inter'),
    ),
    backgroundColor: Color.fromRGBO(52, 52, 55, 1),
      ),
      backgroundColor: Color.fromRGBO(40, 40, 42, 1),
      resizeToAvoidBottomInset: false,
        body: BlocListener<UserCubit, UserState>(
      listener: (context, state) {
        switch (state.runtimeType) {
          case UserUpdatingSuccess:
            showTopSnackBar(
              context,
              const SuccessSnackbar(info: "Пользователь успешно изменен!"),
            );
            Navigator.pushNamed(context, HOME);
            return;
          case UserUpdatingError:
            showTopSnackBar(
              context,
              const ErrorSnackbar(info: "Не удалось изменить пользователя"),
            );
            return;
        }
      },
      child:
          BlocBuilder<UserCubit, UserState>(
            builder: (context, state) {
              switch (state.runtimeType) {
                case UserUpdating:
                  return const CircularProgressIndicator();
                default:
                  return CupertinoScrollbar(
                    child: ListView(
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(32),
                      children: <Widget>[
                        TextField(
                                  onChanged: (String value) async {
                                    context
                                        .read<UserCubit>()
                                        .updateUsername(value);
                                  },
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 14),
                                  cursorColor: Colors.red,
                                  decoration: const InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.red, width: 1.0),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.white, width: 1.0),
                                      ),
                                      labelStyle: TextStyle(
                                        color: Color(0x80FFFFFF),
                                      ),
                                      hintText: "Имя пользователя",
                                      hintStyle: TextStyle(color: Colors.grey)),
                                ),
                        const SizedBox(width: 1, height: 25,),
                        TextField(
                                onChanged: (String value) async {
                                  context
                                      .read<UserCubit>()
                                      .updateFirstName(value);
                                },
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 14),
                                cursorColor: Colors.red,
                                decoration: const InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.red, width: 1.0),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white, width: 1.0),
                                    ),
                                    labelStyle: TextStyle(
                                      color: Color(0x80FFFFFF),
                                    ),
                                    hintText: 'Имя',
                                    hintStyle: TextStyle(color: Colors.grey)),
                              ),
                        const SizedBox(width: 1, height: 25,),
                        TextField(
                                onChanged: (String value) async {
                                  context
                                      .read<UserCubit>()
                                      .updateLastName(value);
                                },
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 14),
                                cursorColor: Colors.red,
                                decoration: const InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.red, width: 1.0),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white, width: 1.0),
                                    ),
                                    labelStyle: TextStyle(
                                      color: Color(0x80FFFFFF),
                                    ),
                                    hintText: 'Фамилия',
                                    hintStyle: TextStyle(color: Colors.grey)),
                              ),
                        const SizedBox(width: 1, height: 25,),
                        TextField(
                          minLines: 3,
                          maxLines:5,
                                onChanged: (String value) async {
                                  context
                                      .read<UserCubit>()
                                      .updateBio(value);
                                },
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 14),
                                cursorColor: Colors.red,
                                decoration: const InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.red, width: 1.0),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white, width: 1.0),
                                    ),
                                    labelStyle: TextStyle(
                                      color: Color(0x80FFFFFF),
                                    ),
                                    hintText: 'О себе',
                                    hintStyle: TextStyle(color: Colors.grey)),
                              ),
                        const SizedBox(width: 1, height: 25,),
                        // DropdownButtonFormField(
                        //         onChanged: (dynamic value) async {
                        //           context
                        //               .read<UserCubit>()
                        //               .updateGender(value);
                        //         },
                        //         style: const TextStyle(
                        //             color: Colors.black, fontSize: 14),
                        //         decoration: const InputDecoration(
                        //             border: InputBorder.none,
                        //             labelStyle: TextStyle(
                        //               color: Color(0x80FFFFFF),
                        //             ),
                        //             hintText: 'Пол',
                        //             hintStyle: TextStyle(color: Colors.grey)),
                        //   items: const [
                        //     DropdownMenuItem(child: Text("Мужчина")),
                        //     DropdownMenuItem(child: Text("Женщина")),
                        //     DropdownMenuItem(child: Text("Не скажу"))
                        //   ],
                        //       ),
                        const Text("Дата рождения", style: TextStyle(color: Colors.white),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("$year/$month/$day", style: const TextStyle(color: Colors.white),),
                            ElevatedButton(
                                onPressed: showDatePicker,
                                child: const Text("Выбрать"),
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(Colors.red),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ))),
                            ),
                            // ElevatedButton(onPressed: () async {
                            //   if (selectedDate != DateTime.now()) {
                            //     context
                            //         .read<UserCubit>()
                            //         .updateDateOfBirth("$year-$month-$day");
                            //   }
                            // }, child: const Text("Выбрать")),
                          ],
                        ),
                        // TextField(
                        //   onChanged: (String value) async {
                        //     context
                        //         .read<UserCubit>()
                        //         .updateDateOfBirth(value);
                        //   },
                        //   style: const TextStyle(
                        //       color: Colors.white, fontSize: 14),
                        //   cursorColor: Colors.red,
                        //   decoration: const InputDecoration(
                        //       focusedBorder: OutlineInputBorder(
                        //         borderSide: BorderSide(color: Colors.red, width: 1.0),
                        //       ),
                        //       enabledBorder: OutlineInputBorder(
                        //         borderSide: BorderSide(color: Colors.white, width: 1.0),
                        //       ),
                        //       labelStyle: TextStyle(
                        //         color: Color(0x80FFFFFF),
                        //       ),
                        //       hintText: 'Дата рождения',
                        //       hintStyle: TextStyle(color: Colors.grey)),
                        // ),
                        const SizedBox(width: 1, height: 25,),
                        const Text("Изображение", style: TextStyle(color: Colors.white),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: image != null
                                  ? Text(image!.path, overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.white))
                                  : const Text("Изображение не выбрано", overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.white)
                              ),
                              width: 220,
                            ),
                            ElevatedButton(
                              onPressed: pickImage,
                              child: const Text("Выбрать"),
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(Colors.red),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ))),
                            ),
                          ],
                        ),
                        const SizedBox(width: 1, height: 25,),
                        SizedBox(
                          width: 75,
                          height: 50,
                          child: ElevatedButton(
                                child: const Text('Изменить профиль',
                                    style: TextStyle(fontSize: 16)),
                                onPressed: ()  async {
                                  // print(state.user.dateOfBirth);
                                  // print(widget.user.dateOfBirth);
                                  print(state);
                                  if (widget.user != state.user) {
                                    BlocProvider.of<UserCubit>(context)
                                        .updateUser(state.user);
                                  }
                                  Navigator.pop(context);
                                  // widget.user = state.user;
                                },
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(Colors.red),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    )))),
                        ),
                        const SizedBox(width: 1, height: 25,),
                        const SizedBox(width: 1, height: 25,),

                        const SizedBox(width: 1, height: 25,),
                        image != null ? Image.file(image!): const Text("Изображение не выбрано"),
                        const SizedBox(width: 1, height: 525,),

                        const SizedBox(width: 1, height: 25,),


                      ]
                    ),
                  );
              }
            },
          ),
        ),
      );
  }
  void showDatePicker()
  {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext builder) {
        return Container(
          height: MediaQuery.of(context).copyWith().size.height*0.35,
          color: Colors.white,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.date,
            onDateTimeChanged: (value) {
              if (value != selectedDate) {
                setState(() {
                  selectedDate = value;
                  year = selectedDate.year.toString();
                  month = selectedDate.month.toString();
                  day = selectedDate.day.toString();
                  if(month.length == 1) {
                    month = '0'+month;
                  }
                  if(day.length == 1) {
                    day = '0'+day;
                  }
                  if (selectedDate != DateTime.now())  {
                    context
                        .read<UserCubit>()
                        .updateDateOfBirth("$year-$month-$day");
                  }
                  print(selectedDate.year);

                });
              }
            },
            initialDateTime: DateTime.now(),
            minimumYear: 1920,
            maximumYear: DateTime.now().year,
          ),
        );
      }
  );
  }
}
