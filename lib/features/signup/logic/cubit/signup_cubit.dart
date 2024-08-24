import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medisync/features/signup/data/models/signup_request_body.dart';
import 'package:medisync/features/signup/data/repos/signup_repo.dart';
import 'package:medisync/features/signup/logic/cubit/signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.signupRepo) : super(const SignupState.initial());
  final SignupRepo signupRepo;
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  Future<void> emitSignup() async {
    emit(const SignupState.loading());
    final response = await signupRepo.signup(SignupRequestBody(
      name: nameController.text,
      phone: phoneController.text,
      email: emailController.text,
      password: passwordController.text,
      passwordConfirmation: passwordConfirmationController.text,
      gender: 0,
    ));
    response.when(
      sucess: (signupResponse) {
        emit(SignupState.success(signupResponse));
      },
      failure: (error) {
        emit(SignupState.failure(error: error.apiErrorModel.message ?? ""));
      },
    );
  }
}
