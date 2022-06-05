import 'package:animeet/bloc/user/user_cubit.dart';
import 'package:animeet/constants/locator.dart';
import 'package:animeet/constants/paths.dart';
import 'package:animeet/constants/storage.dart';
import 'package:animeet/data/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({Key? key,}) : super(key: key);

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {

  late UserModel user;
  late String userAvatar;
  late String userFirstName;
  late String userLastName;
  late String userAge;

  // @override
  // void initState() {
  //   user = BlocProvider.of<UserCubit>(context).state.user;
  //   super.initState();
  // }

  void refresh() {
    setState(() {
      BlocProvider.of<UserCubit>(context).getUser("me");
      // print(BlocProvider.of<UserCubit>(context).state.user.username);
      // print(user.username);
    });
  }

  @override
  Widget build(BuildContext context) {
    user = getIt<UserCubit>().state.user;
    // print(user.username);
    // print(BlocProvider.of<UserCubit>(context).state.user.username);
    // print(BlocProvider.of<UserCubit>(context).state);

    return Stack(children: [
      Positioned(
        right: 10,
        top: 10,
        child: IconButton(
            icon: const Icon(
              Icons.exit_to_app_outlined,
              size: 40,
            ),
            onPressed: () async {
              await storage.deleteAll();
              Navigator.pushNamedAndRemoveUntil(context, AUTH, (r) => false);
            }),
      ),
      Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // const SizedBox(width: double.infinity, height: 100,),
              CircleAvatar(
                minRadius: 60,
                maxRadius: 100,
                // radius: 80,
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage(user.avatar ??
                    'https://socialistmodernism.com/wp-content/uploads/2017/07/placeholder-image.png?w=640'),
              ),
              Text(
                user.username ?? "undefined",
                style: const TextStyle(
                  fontSize: 30,
                ),
              ),
              const SizedBox(
                width: double.infinity,
                height: 70,
              ),
              Padding(
                  padding: const EdgeInsets.all(15),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Имя: " + user.firstName! + " " + user.lastName!,
                          style: const TextStyle(
                            fontSize: 22,
                          ),
                        ),
                        Text(
                          "Возраст: " + user.age.toString(),
                          style: const TextStyle(
                            fontSize: 22,
                          ),
                        ),
                        Text(
                          "О себе: " + user.bio!,
                          style: const TextStyle(
                            fontSize: 22,
                          ),
                        )
                      ],
                    ),
                  )),
              ElevatedButton(
                  onPressed: () =>
                      {
                        Navigator.of(context).pushNamed(UPDATE, arguments: user),
                      },
                  child: const Text("Изменить профиль"),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                  shape: MaterialStateProperty.all<
                      RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ))),
              ),
              // ElevatedButton(
              //     onPressed: () =>
              //     {
              //       refresh()
              //     },
              //     child: const Text("обновить"))
            ],
          ),
        ),
      ),
    ]);
  }
}
