/// username : "test2"
/// phone_number : "+79900000000"
/// password : "testtest"
/// password2 : "testtest"
/// code : "C9QLCSQ-MpT5kZW_lgFFBTwnlLRNWOZM8yNgplPwkTw"

class SignUpModel {
  SignUpModel({
      this.username, 
      this.phoneNumber, 
      this.password, 
      this.password2, 
      this.code,});

  SignUpModel.fromJson(dynamic json) {
    username = json['username'];
    phoneNumber = json['phone_number'];
    password = json['password'];
    password2 = json['password2'];
    code = json['code'];
  }
  String? username;
  String? phoneNumber;
  String? password;
  String? password2;
  String? code;
SignUpModel copyWith({  String? username,
  String? phoneNumber,
  String? password,
  String? password2,
  String? code,
}) => SignUpModel(  username: username ?? this.username,
  phoneNumber: phoneNumber ?? this.phoneNumber,
  password: password ?? this.password,
  password2: password2 ?? this.password2,
  code: code ?? this.code,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['username'] = username;
    map['phone_number'] = phoneNumber;
    map['password'] = password;
    map['password2'] = password2;
    map['code'] = code;
    return map;
  }

}