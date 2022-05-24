
import 'package:animeet/constants/paths.dart';
import 'package:animeet/constants/storage.dart';
import 'package:animeet/data/models/user.dart';
import 'package:flutter/material.dart';

class MyProfileScreen extends StatelessWidget {
  UserModel user;
  MyProfileScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var userAvatar = user.avatar ?? 'https://socialistmodernism.com/wp-content/uploads/2017/07/placeholder-image.png?w=640';
    var userFirstName = user.firstName ?? '';
    var userLastName = user.lastName ?? user.username ?? "undefined";
    var userAge = user.age ?? "undefined";
    return Stack(
      children: [
          Positioned(
            right: 10,
            top: 10,
            child: IconButton(
                icon: const Icon(
                  Icons.exit_to_app_outlined,
                  size: 40,
                ),
                onPressed: () async  {
                  await storage.deleteAll();
                  Navigator.pushNamedAndRemoveUntil(context, AUTH, (r) => false);
                }),
          ),
      Center(
        child: Column(
          children: [
            const SizedBox(width: double.infinity, height: 100,),
            CircleAvatar(
              minRadius: 60,
              maxRadius: 100,
              // radius: 80,
              backgroundColor: Colors.white,
              backgroundImage: NetworkImage(userAvatar),
            ),
            Text(user.username ?? "undefined",
              style: const TextStyle(
                fontSize: 30,
              ),
            ),
            const SizedBox(width: double.infinity, height: 70,),
            Padding(
              padding: const EdgeInsets.all(15),
              child:Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Name: " + userFirstName + " " + userLastName,
                          style: const TextStyle(
                            fontSize: 22,
                          ),),
                        Text("Age: " + userAge.toString(),
                          style: const TextStyle(
                            fontSize: 22,
                          ),)
                      ],
                    ),
                  )
              ),
          ],
        ),
      ),
      ]
    );
  }
}
