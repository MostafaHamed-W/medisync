import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_state.freezed.dart';

@freezed
class LoginState<T> with _$LoginState<T> {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.loading() = Loeading;
  const factory LoginState.sucess(T data) = Success<T>;
  const factory LoginState.failure({required String error}) = Error;
}
