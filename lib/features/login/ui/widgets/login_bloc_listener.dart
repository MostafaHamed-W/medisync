import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medisync/core/helpers/extensions.dart';
import 'package:medisync/core/networking/api_error_model.dart';
import 'package:medisync/core/routing/routes.dart';
import 'package:medisync/core/theming/styles.dart';
import 'package:medisync/features/login/logic/cubit/login_cubit.dart';
import 'package:medisync/features/login/logic/cubit/login_state.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) => current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () => showDialog(
            context: context,
            builder: (context) => const Center(
              child: CircularProgressIndicator(
                color: Colors.blue,
              ),
            ),
          ),
          failure: (apiErrorModel) {
            context.pop();
            setupErrorState(context, apiErrorModel);
          },
          sucess: (loginResponse) {
            context.pop();
            Navigator.pushNamed(context, Routes.homeScreen);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }

  Future<dynamic> setupErrorState(BuildContext context, ApiErrorModel apiErrorModel) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(
          Icons.error,
          color: Colors.red,
          size: 32,
        ),
        content: Text(
          apiErrorModel.getAllErrorMessages(),
          style: TextStyles.font15DarkBlueMedium,
        ),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: Text(
              'Got it',
              style: TextStyles.font14BlueSemiBold,
            ),
          ),
        ],
      ),
    );
  }
}
