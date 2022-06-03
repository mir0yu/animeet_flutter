import 'package:animeet/data/models/match.dart';
import 'package:animeet/data/models/user.dart';
import 'package:http/http.dart';
import 'package:animeet/data/services/user/user_api.dart';


class UserRepository {
  final UserNetworkService networkService;
  UserRepository(this.networkService);

  // Future<Response> addUser(UserModel user) async {
  //   return await networkService.addUser(user);
  // }

  Future<List<UserModel>> getUsers() async {
    return await networkService.getUsers();
  }

  Future<List<UserModel>> getUsersForMatching() async {
    return await networkService.getUsersForMatching();
  }
  Future<Response> makeRequestForMatch(MatchModel match) async {
    return await networkService.makeRequestForMatch(match);
  }

  Future<UserModel> getUser(String username) async {
    return await networkService.getUser(username);
  }

  Future<Response> updateUser(UserModel user) async {
    return await networkService.updateUser(user);
  }
}
