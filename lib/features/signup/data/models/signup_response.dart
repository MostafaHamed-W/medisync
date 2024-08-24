import 'package:json_annotation/json_annotation.dart';
part 'signup_response.g.dart';

@JsonSerializable()
class SignupResponse {
  final String? message;
  @JsonKey(name: "data")
  final UserErrorData? userData;
  final bool? status;
  final int? code;

  SignupResponse({
    required this.message,
    required this.userData,
    required this.status,
    required this.code,
  });

  factory SignupResponse.fromJson(Map<String, dynamic> json) => _$SignupResponseFromJson(json);
}

@JsonSerializable()
class UserErrorData {
  List<String>? name;
  List<String>? email;
  List<String>? phone;
  List<String>? password;

  UserErrorData({this.name, this.email, this.phone, this.password});

  factory UserErrorData.fromJson(Map<String, dynamic> json) => _$UserErrorDataFromJson(json);
}
