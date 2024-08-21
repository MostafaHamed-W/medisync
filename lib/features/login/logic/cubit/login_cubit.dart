import 'package:medisync/features/login/data/models/login_request_body.dart';
import 'package:medisync/features/login/data/repos/login_repo.dart';
import 'package:medisync/features/login/logic/cubit/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(const LoginState.initial());

  void emitLoginStates(LoginRequestBody loginRequestBody) async {
    final response = await _loginRepo.login(loginRequestBody);
    response.when(sucess: (loginRequestBody) {
      emit(LoginState.sucess(response));
    }, failure: (error) {
      emit(LoginState.failure(error: error.apiErrorModel.message ?? ""));
    });
  }
}
