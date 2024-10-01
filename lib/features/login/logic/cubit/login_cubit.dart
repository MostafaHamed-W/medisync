import 'package:flutter/material.dart';
import 'package:medisync/core/helpers/constants.dart';
import 'package:medisync/core/helpers/shared_preferences_helper.dart';
import 'package:medisync/core/networking/dio_factory.dart';
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
    response.when(sucess: (loginRequestBody) async {
      await saveUserToken(loginRequestBody.userData?.token ?? "");
      emit(LoginState.sucess(response));
    }, failure: (error) {
      emit(LoginState.failure(error: error.apiErrorModel.message ?? ""));
    });
  }

  Future<void> saveUserToken(String token) async {
    await SharedPrefHelper.setSecuredString(SharedPrefKeys.userToken, token);
    DioFactory.setTokenAfterLogin(token);
  }
}
