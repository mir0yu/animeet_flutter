/// id : 6
/// username : "secondtestuser"
/// first_name : null
/// last_name : null
/// bio : ""
/// avatar : "http://192.168.0.103:8080/media/default.jpg"
/// age : 32
/// dateOfBirth : "2002-09-22"
/// created_at : "2022-04-15"
/// gender : "U"

class UserModel {
  UserModel({
      this.id, 
      this.username, 
      this.firstName, 
      this.lastName, 
      this.bio, 
      this.avatar, 
      this.age,
      this.dateOfBirth,
      this.createdAt, 
      this.gender,});

  UserModel.fromJson(dynamic json) {
    id = json['id'];
    username = json['username'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    bio = json['bio'];
    avatar = json['avatar'];
    age = json['age'];
    dateOfBirth = json['date_of_birth'];
    createdAt = json['created_at'];
    gender = json['gender'];
  }
  int? id;
  String? username;
  String? firstName;
  String? lastName;
  String? bio;
  String? avatar;
  int? age;
  String? dateOfBirth;
  String? createdAt;
  String? gender;
  String? error;


  UserModel.withError(String errorMessage) {
    error = errorMessage;
  }
UserModel copyWith({  int? id,
  String? username,
  String? firstName,
  String? lastName,
  String? bio,
  String? avatar,
  int? age,
  String? dateOfBirth,
  String? createdAt,
  String? gender,
}) => UserModel(  id: id ?? this.id,
  username: username ?? this.username,
  firstName: firstName ?? this.firstName,
  lastName: lastName ?? this.lastName,
  bio: bio ?? this.bio,
  avatar: avatar ?? this.avatar,
  age: age ?? this.age,
  dateOfBirth: dateOfBirth ?? this.dateOfBirth,
  createdAt: createdAt ?? this.createdAt,
  gender: gender ?? this.gender,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['username'] = username;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['bio'] = bio;
    map['avatar'] = avatar;
    map['age'] = age;
    map['date_of_birth'] = dateOfBirth;
    map['created_at'] = createdAt;
    map['gender'] = gender;
    return map;
  }

}