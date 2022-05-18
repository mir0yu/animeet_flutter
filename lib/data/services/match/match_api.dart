import 'dart:convert';

import 'package:animeet/constants/paths.dart';
import 'package:animeet/constants/storage.dart';
import 'package:animeet/data/models/match.dart';
import 'package:animeet/data/models/user.dart';
import 'package:animeet/data/services/user/user_api.dart';

import 'package:http/http.dart' as http;

class MatchNetworkService {
  final UserNetworkService service;

  MatchNetworkService(this.service);

  getMatches() async {

      String? t = await storage.read(key: 'token');
      String? token = t.toString();
      String? id = await storage.read(key: 'id');

      final response = await http.get(
        Uri.parse('$BASE_URL/matches/?user_id=$id'),
        headers: {
          "Content-Type": "application/json",
          "Authorization": 'Bearer $token'
        },
      );
      var rawMatches = jsonDecode(utf8.decode(response.bodyBytes));
      print(rawMatches);
      List<MatchModel> matches = rawMatches
          .map<MatchModel>((match) => MatchModel.fromJson((match)))
          .toList();
      print(matches);
      List<UserModel> users = [];
      for (int i=0; i<matches.length; i++) {
        UserModel user = await service.getUser(matches[i].receiver.id!.toString());
        print(user.avatar);
        users.add(user);
      }
      print(users[0].id);
      print(users[0].avatar);

      return users;
  }
}