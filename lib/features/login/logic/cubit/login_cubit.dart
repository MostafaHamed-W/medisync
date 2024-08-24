import 'package:flutter/material.dart';
import 'package:medisync/features/login/data/models/login_request_body.dart';
import 'package:medisync/features/login/data/repos/login_repo.dart';
import 'package:medisync/features/login/logic/cubit/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(const LoginState.initial());

  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitLoginStates() async {
    emit(const LoginState.loading());
    final response = await _loginRepo.login(
      LoginRequestBody(
        email: loginEmailController.text,
        password: loginPasswordController.text,
      ),
    );
    response.when(sucess: (loginRequestBody) {
      emit(LoginState.sucess(response));
    }, failure: (error) {
      emit(LoginState.failure(error: error.apiErrorModel.message ?? ""));
    });
  }
}
