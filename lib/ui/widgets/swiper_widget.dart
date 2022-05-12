import 'package:animeet/bloc/user/user_cubit.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserSwiper extends StatelessWidget {
  const UserSwiper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<UserCubit>(context).fetchUsers();
    return BlocBuilder<UserCubit, UserState>(builder: (context, state) {
      switch (state.runtimeType) {
        case UsersLoaded:
          return Swiper(
            itemBuilder: (BuildContext context, int index) {
              String avatar = state.users[index].avatar!;
              String username = state.users[index].username!;
              String gender = state.users[index].gender!;
              int age = state.users[index].age!;
              String firstName = state.users[index].firstName?? "";
              String lastName = state.users[index].lastName?? "";
              print(state.users[index].username);
              return Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(avatar))
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                          right: 5,
                          bottom: 150,
                          child: Column(
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    shape: const CircleBorder(),
                                    padding: const EdgeInsets.all(10) ,
                                    primary: Colors.white30
                                ),
                                child: const Icon(
                                  Icons.favorite_rounded,
                                  size: 40,
                                  color: Colors.blue,),
                              ),
                              const SizedBox(height: 10, width: 1,),
                              ElevatedButton(
                                  // onPressed: () {
                                  //   // state.users.removeAt(index);},
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      shape: const CircleBorder(),
                                      padding: const EdgeInsets.all(10),
                                      primary: Colors.white30
                                  ),
                                  child: const Icon(
                                    Icons.close,
                                    size: 40,
                                    color: Colors.red,)
                              )
                            ],)
                      ),
                      Positioned(
                          bottom: 10,
                          left: 15,
                          right: 15,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      username +
                                        ', ' +
                                        age.toString(),
                                    style: const TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                    overflow: TextOverflow.fade,
                                  ),
                                  // const SizedBox(width: 30, height: 1,),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 3),
                                    child: Icon(
                                     gender == 'U'
                                          ? Icons.accessible_forward_rounded
                                          : gender == 'F'
                                            ? Icons.female_rounded
                                            : Icons.male_rounded,
                                      color: Colors.white,
                                      size: 35,
                                    ),
                                  ),
                                ],
                              ),
                              // Text(firstName + " " + lastName,
                              //   style: const TextStyle(
                              //     fontSize: 25,
                              //     color: Colors.white
                              //   ),),
                              const SizedBox(height: 10, width: 1,),
                              Text(state.users[index].bio!,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                  fontFamily: 'Inter',
                                ),
                              ),
                            ],
                          )),
                    ],
                  ));
            },
            itemCount: state.users.length,
            scrollDirection: Axis.vertical,
            // onIndexChanged: (index) => state.users.removeAt(index),
            // axisDirection: AxisDirection.down,
          );
        default:
          return const CupertinoActivityIndicator();
      }
    });
  }
}
