import 'package:animeet/data/models/user.dart';

/// sender : 5
/// receiver : 1

class MatchModel {
  MatchModel({
      required this.sender,
      required this.receiver,});

  MatchModel.fromJson(dynamic json) {
    sender = UserModel(id: json['sender']);
    receiver = UserModel(id: json['receiver']);
    print(json['sender']);
  }
  late UserModel sender;
  late UserModel receiver;
MatchModel copyWith({  UserModel? sender,
  UserModel? receiver,
}) => MatchModel(  sender: sender ?? this.sender,
  receiver: receiver ?? this.receiver,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['sender'] = sender.id;
    map['receiver'] = receiver.id;
    return map;
  }

}