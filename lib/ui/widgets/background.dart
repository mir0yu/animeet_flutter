import 'package:flutter/material.dart';

Color fromHex(String hexString) {
final buffer = StringBuffer();
if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
buffer.write(hexString.replaceFirst('#', ''));
return Color(int.parse(buffer.toString(), radix: 16));
}

class Background extends StatelessWidget {
  const Background({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      // decoration: const BoxDecoration(
      //   gradient: RadialGradient(
      //     colors: [Color(0xff042b4a), Color(0xff000000)],
      //     center: Alignment.center,
      //     radius: 0.8,
      //   )
      //
      // ),
      // decoration: BoxDecoration(
      //     gradient: LinearGradient(
      //         begin: Alignment.centerLeft,
      //         end: Alignment.centerRight,
      //         colors: [
      //           fromHex('#EDE7FF'),
      //           fromHex('#E5EBFF'),
      //         ])),
    );
  }
}