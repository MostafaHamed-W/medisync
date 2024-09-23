import 'package:json_annotation/json_annotation.dart';
part 'specialization_response_model.g.dart';

@JsonSerializable()
class SpecializationResponseModel {
  @JsonKey(name: 'data')
  final List<SpecializationData?>? specializationDataList;

  SpecializationResponseModel({required this.specializationDataList});

  factory SpecializationResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SpecializationResponseModelFromJson(json);
}

@JsonSerializable()
class SpecializationData {
  final int? id;
  final String? name;
  List<Doctors> doctors;

  SpecializationData({required this.id, required this.name, required this.doctors});

  factory SpecializationData.fromJson(Map<String, dynamic> json) => _$SpecializationDataFromJson(json);
}

@JsonSerializable()
class Doctors {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? photo;
  String? gender;
  @JsonKey(name: 'appoint_price')
  int? price;
  String degree;

  Doctors({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.photo,
    required this.gender,
    required this.price,
    required this.degree,
  });

  factory Doctors.fromJson(Map<String, dynamic> json) => _$DoctorsFromJson(json);
}
