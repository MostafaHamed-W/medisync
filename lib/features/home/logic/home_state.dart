import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medisync/core/networking/api_error_handler.dart';
import 'package:medisync/features/home/data/models/specialization_response_model.dart';
part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  // Specilaizations States
  const factory HomeState.initial() = _Initial;
  const factory HomeState.specializationsLoading() = SpecializationsLoading;
  const factory HomeState.specializationsSuccess(List<SpecializationData?> specilaizationData) =
      SpecializationsSuccess;
  const factory HomeState.specializationsFailure(ErrorHandler errorHandler) = SpecializationsError;

  // Doctors list states
  const factory HomeState.doctorsSuccess(List<Doctors>? doctors) = DoctorsSuccess;
  const factory HomeState.doctorsFailure(ErrorHandler errorHandler) = DoctorsFailure;
  
}
