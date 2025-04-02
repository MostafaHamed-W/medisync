import 'package:json_annotation/json_annotation.dart';
part 'api_error_model.g.dart';

@JsonSerializable()
class ApiErrorModel {
  final String? message;
  final int? code;
  @JsonKey(name: 'data')
  final dynamic errors;

  ApiErrorModel({
    this.message,
    this.code,
    this.errors,
  });

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) => _$ApiErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApiErrorModelToJson(this);

  /// Returns a String containing all the error messages
  String getAllErrorMessages() {
    if (errors == null || errors is List && (errors as List).isEmpty) {
      return message ?? "Unknown Error occurred";
    }

    // TODO : explain this new update
    if (errors is Map<String, dynamic>) {
      final errorMessage = (errors as Map<String, dynamic>).entries.map((entry) {
        final value = entry.value;
        return "${value.join(',')}";
      }).join('\n');

      return errorMessage;
    } else if (errors is List) {
      return (errors as List).join('\n');
    }

    return message ?? "Unknown Error occurred";
  }
}

// errors shape:
// {
//     "name": [
//         "The name field is required."
//     ],
//     "email": [
//         "The email field is required."
//     ],
//     "phone": [
//         "The phone field is required."
//     ],
//     "gender": [
//         "The gender field is required."
//     ],
//     "password": [
//         "The password field is required."
//     ]
// }
