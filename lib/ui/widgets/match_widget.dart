import 'package:animeet/constants/paths.dart';
import 'package:animeet/data/models/user.dart';
import 'package:flutter/material.dart';

class MatchWidget extends StatelessWidget {
  final UserModel user;
  const MatchWidget({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {Navigator.pushNamed(context, PROFILE, arguments: user);},
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
            image: DecorationImage(
              image: NetworkImage(user.avatar!),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
              children: [Text(user.username!)]),
        ),
      ),
    );
  }
}
