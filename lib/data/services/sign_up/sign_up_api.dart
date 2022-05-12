import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:animeet/constants/paths.dart';

class SignUpNetworkService {
  signUp(String username, String phoneNumber, String password, String password2, String code) async {
    final response = await http.post(Uri.parse('$BASE_URL/users/'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "username": username,
          "phone_number": phoneNumber,
          "password": password,
          "password2": password2,
          "code": code
        }));
    return response;
  }
}