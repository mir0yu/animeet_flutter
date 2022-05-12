import 'dart:convert';

class LogInData {
  String phoneNumber;
  String password;

  LogInData({
    this.phoneNumber = "",
    this.password = "",
  });

  LogInData copyWith({
    String? phoneNumber,
    String? password,
  }) {
    return LogInData(
      phoneNumber: phoneNumber ?? this.phoneNumber,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'phone_number': phoneNumber,
      'password': password,
    };
  }

  factory LogInData.fromMap(Map<String, dynamic> map) {
    return LogInData(
      phoneNumber: map['phone_number'] ?? '',
      password: map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory LogInData.fromJson(String source) =>
      LogInData.fromMap(json.decode(source));

  @override
  String toString() => 'LogInData(phone_number: $phoneNumber, password: $password)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LogInData &&
        other.phoneNumber == phoneNumber &&
        other.password == password;
  }

  @override
  int get hashCode => phoneNumber.hashCode ^ password.hashCode;
}