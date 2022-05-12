import 'package:animeet/data/services/login/login_api.dart';
import 'package:http/http.dart';

class LoginRepository {
  final LoginNetworkService networkService;
  LoginRepository(this.networkService);

  Future<Response> loginUser(String phoneNumber, String password) async {
    return await networkService.login(phoneNumber, password);
  }
}