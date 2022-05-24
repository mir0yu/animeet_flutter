import 'package:animeet/data/models/user.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  UserModel user;
  ProfileScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var userAvatar = user.avatar ??
        'https://socialistmodernism.com/wp-content/uploads/2017/07/placeholder-image.png?w=640';
    var userFirstName = user.firstName ?? '';
    var userLastName = user.lastName ?? user.username ?? "undefined";
    var userUsername = user.username ?? "undefined";
    var userAge = user.age ?? "undefined";
    var userGender = user.gender ?? "undefined";
    var userBio = user.bio ?? "undefined";
    var userCreated = user.createdAt ?? "undefined";
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading:
          IconButton(
            onPressed: () => {Navigator.of(context).pop(true)},
            icon: const Icon(Icons.arrow_back)
            ),
      ),
      extendBodyBehindAppBar: true,
      body: Center(
        child: Column(children: [
          Center(
            child: Column(children: [
              Stack(
                children: [
                  Container(
                    height: 400,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(userAvatar),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 8),
                          child: Row(
                            children: const [
                              Text(''),
                              // Text(
                              //   userUsername + ' ',
                              //   style: const TextStyle(
                              //     // fontWeight: FontWeight.normal,
                              //     fontSize: 35,
                              //   ),
                              // ),
                              // Text(
                              //   userAge.toString(),
                              //   style: const TextStyle(
                              //     fontSize: 35,
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          userFirstName + " " + userLastName + " ",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          userAge.toString() + " ",
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Icon(
                          userGender == 'U'
                              ? Icons.accessible_forward_rounded
                              : userGender == 'F'
                                  ? Icons.female_rounded
                                  : Icons.male_rounded,
                          color: Colors.black,
                          size: 22,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                      width: 1,
                    ),
                    const Text(
                      "Обо мне",
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w600),
                    ),
                    const Divider(
                      color: Colors
                          .grey, // The color to use when painting the line.
                      height: 20, // The divider's height extent.
                    ),
                    Text(
                      userBio,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    const Divider(
                      color: Colors
                          .grey, // The color to use when painting the line.
                      height: 20, // The divider's height extent.
                    ),
                    Text(
                      "В приложении с " + userCreated.toString(),
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w700),
                    )
                  ],
                ),
              ),
            ]),
          )
        ]),
      ),
    );
  }
}
