import 'dart:convert';

import 'package:animeet/constants/paths.dart';
import 'package:animeet/constants/storage.dart';

import 'package:http/http.dart' as http;

class UserNetworkService {

  getUsers() async {
    String? t = await storage.read(key: 'token');
    String? token = t.toString();

    final response = await http.get(Uri.parse('$BASE_URL/users/'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": 'Bearer $token'
      },
    );
    print(response.body);
    return response;
  }

  getUsersForMatching() async {
    String? t = await storage.read(key: 'token');
    String? token = t.toString();

    final response = await http.get(Uri.parse('$BASE_URL/recommend/'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": 'Bearer $token'
      },
    );
    print(response.body);
    return response;
  }

  swipeLeft() async {
    String? t = await storage.read(key: 'token');
    String? token = t.toString();

    final response = await http.get(Uri.parse('$BASE_URL/recommend/'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": 'Bearer $token'
      },
    );
    print(response.body);
    return response;
  }

  // updateUser(UserModel user) async {
  //   String? t = await storage.read(key: 'token');
  //   String? token = t.toString();
  //
  //   int? userId = user.id;
  //
  //   final response = await http.put(Uri.parse('$BASE_URL/users/$userId'),
  //     headers: {
  //       "Content-Type": "application/json",
  //       "Authorization": 'Bearer $token'
  //     },
  //     body: jsonEncode({
  //       "text": user.text,
  //     })
  //   );
  //   return response;
  // }

  // getAllUserTweets()
}