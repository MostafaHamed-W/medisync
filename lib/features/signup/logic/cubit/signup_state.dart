import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medisync/core/networking/api_error_model.dart';

part 'signup_state.freezed.dart';

@Freezed()
class SignupState<T> with _$SignupState {
  const factory SignupState.initial() = _Initial;
  const factory SignupState.loading() = Loading;
  const factory SignupState.success(T data) = Success<T>;
  const factory SignupState.failure(ApiErrorModel apiErrorModel) = Error;
}
