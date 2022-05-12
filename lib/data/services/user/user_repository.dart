import 'package:http/http.dart';
import 'package:animeet/data/models/user.dart';
import 'package:animeet/data/services/user/user_api.dart';


class UserRepository {
  final UserNetworkService networkService;
  UserRepository(this.networkService);

  // Future<Response> addUser(UserModel user) async {
  //   return await networkService.addUser(user);
  // }

  Future<Response> getUsers() async {
    return await networkService.getUsers();
  }

  Future<Response> getUsersForMatching() async {
    return await networkService.getUsersForMatching();
  }

  // Future<Response> updateUser(UserModel user) async {
  //   return await networkService.updateUser(user);
  // }
}
