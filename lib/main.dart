import 'package:animeet/constants/locator.dart';
import 'package:animeet/route.dart';
import 'package:flutter/material.dart';

void main() async {
  Paint.enableDithering = true;
  await setupLocator();
  runApp(Animeet(router: AppRouter()));
}

class Animeet extends StatelessWidget {
  final AppRouter router;
  const Animeet({Key? key, required this.router}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: "/auth",
        debugShowCheckedModeBanner: false,
        title: 'Animeet',
        theme: ThemeData(fontFamily: 'Montserrat'),
    onGenerateRoute: router.generateRoute,
    );
  }
}
