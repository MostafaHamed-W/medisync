import 'package:json_annotation/json_annotation.dart';
part 'signup_request_body.g.dart';

@JsonSerializable()
class SignupRequestBody {
  final String name;
  final String phone;
  final String email;
  final String password;
  final int gender;
  @JsonKey(name: "password_confirmation")
  final String passwordConfirmation;

  SignupRequestBody({
    required this.name,
    required this.phone,
    required this.email,
    required this.password,
    required this.passwordConfirmation,
    required this.gender,
  });

  Map<String, dynamic> toJson() => _$SignupRequestBodyToJson(this);
}
