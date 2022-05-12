import 'package:http/http.dart';
import 'package:animeet/data/services/sign_up/sign_up_api.dart';

class SignUpRepository {
  final SignUpNetworkService networkService;
  SignUpRepository(this.networkService);

  Future<Response> signUp(
      String username, String phoneNumber, String password, String password2, String code) async {
    return await networkService.signUp(username, phoneNumber, password, password2, code);
  }
}