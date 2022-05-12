import 'dart:convert';

import 'package:animeet/constants/paths.dart';
import 'package:animeet/constants/storage.dart';
import 'package:http/http.dart' as http;

class AuthenticationNetworkService {
  auth() async {
    String? token = await storage.read(key: 'token');
    final response = await http.post(Uri.parse('$BASE_URL/token/verify/'),
      headers: {"Content-Type": "application/json",},
      body: jsonEncode({"token": token.toString()}),
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}