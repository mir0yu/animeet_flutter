import 'package:animeet/data/models/match.dart';
import 'package:animeet/data/models/user.dart';
import 'package:animeet/data/services/match/match_api.dart';


class MatchRepository {
  final MatchNetworkService networkService;
  MatchRepository(this.networkService);


  Future<List<UserModel>> getMatches() async {
    return await networkService.getMatches();
  }
}
