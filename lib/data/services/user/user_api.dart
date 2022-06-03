import 'dart:convert';

import 'package:animeet/constants/paths.dart';
import 'package:animeet/constants/storage.dart';
import 'package:animeet/data/models/match.dart';
import 'package:animeet/data/models/user.dart';

import 'package:http/http.dart' as http;

class UserNetworkService {
  getUsers() async {
    try {
      String? t = await storage.read(key: 'token');
      String? token = t.toString();

      final response = await http.get(
        Uri.parse('$BASE_URL/users/'),
        headers: {
          "Content-Type": "application/json",
          "Authorization": 'Bearer $token'
        },
      );
      var rawUsers = jsonDecode(utf8.decode(response.bodyBytes));
      List<UserModel> users = rawUsers['results']
          .map<UserModel>((user) => UserModel.fromJson((user)))
          .toList();
      print(users);
      return users;
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return UserModel.withError("Data not found / Connection issue");
    }
  }

  getUser(String username) async {
    try {
      String? t = await storage.read(key: 'token');
      String? token = t.toString();

      final response = await http.get(
        Uri.parse('$BASE_URL/users/$username'),
        headers: {
          "Content-Type": "application/json",
          "Authorization": 'Bearer $token'
        },
      );
      var rawUser= jsonDecode(utf8.decode(response.bodyBytes));
      UserModel user = UserModel.fromJson((rawUser));
      print(username);

      if (username == 'me' && response.statusCode == 200) {
          await storage.write(key: 'id', value: user.id.toString());
      }
      print(user.avatar);
      return user;
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return UserModel.withError("Data not found / Connection issue");
    }
  }

  getUsersForMatching() async {
    try {
      String? t = await storage.read(key: 'token');
      String? token = t.toString();

      final response = await http.get(
        Uri.parse('$BASE_URL/recommend/'),
        headers: {
          "Content-Type": "application/json",
          "Authorization": 'Bearer $token'
        },
      );
      var rawUsers = jsonDecode(utf8.decode(response.bodyBytes));
      List<UserModel> users = rawUsers['results']
          .map<UserModel>((user) => UserModel.fromJson((user)))
          .toList();
      print(users);
      return users;
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return UserModel.withError("Data not found / Connection issue");
    }
  }

  makeRequestForMatch(MatchModel match) async {
    String? t = await storage.read(key: 'token');
    String? token = t.toString();

    final response = await http.post(Uri.parse('$BASE_URL/requests/'),
        headers: {
          "Content-Type": "application/json",
          "Authorization": 'Bearer $token'
        },
        body: jsonEncode(
            {"sender": match.sender.id, "receiver": match.receiver.id}));
    print(response.body);
    return response;
  }

  updateUser(UserModel user) async {
    String? t = await storage.read(key: 'token');
    String? token = t.toString();

    int? userId = user.id;

    print(user.dateOfBirth);
    final response = await http.patch(Uri.parse('$BASE_URL/users/$userId/'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": 'Bearer $token'
      },
      body: jsonEncode({
        "username": user.username,
        "first_name": user.firstName,
        "last_name": user.lastName,
        "bio": user.bio,
        "date_of_birth": user.dateOfBirth,
        "gender": user.gender

      })
    );
    print(response.body);
    return response;
  }

  // getAllUserTweets()
}
