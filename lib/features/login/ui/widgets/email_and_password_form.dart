import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medisync/core/helpers/app_regex.dart';
import 'package:medisync/core/helpers/spacing.dart';
import 'package:medisync/core/widgets/custom_text_field.dart';
import 'package:medisync/features/login/logic/cubit/login_cubit.dart';
import 'package:medisync/features/login/ui/widgets/password_validation.dart';

class EmailAndPasswordForm extends StatefulWidget {
  const EmailAndPasswordForm({super.key});

  @override
  State<EmailAndPasswordForm> createState() => _EmailAndPasswordFormState();
}

class _EmailAndPasswordFormState extends State<EmailAndPasswordForm> {
  bool isObsucured = true;
  late TextEditingController passwordController;
  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasSpecialCharacter = false;
  bool hasNumber = false;
  bool hasMinLenght = false;

  @override
  void initState() {
    passwordController = context.read<LoginCubit>().loginPasswordController;
    setUpPasswordListener();
    super.initState();
  }

  setUpPasswordListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowerCase = AppRegex.hasLowerCase(passwordController.text);
        hasUpperCase = AppRegex.hasUpperCase(passwordController.text);
        hasSpecialCharacter = AppRegex.hasSpecialCharacter(passwordController.text);
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasMinLenght = AppRegex.hasMinLength(passwordController.text);
      });
    });
  }

  @override
  void dispose() {
    // passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          CustomTextField(
            controller: context.read<LoginCubit>().loginEmailController,
            validator: (value) {
              if (value == null || value.isEmpty || !AppRegex.isEmailValid(value)) {
                return "Please enter a valid email";
              }
            },
            hintText: "Email",
          ),
          verticalHight(16),
          CustomTextField(
            controller: context.read<LoginCubit>().loginPasswordController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter a valid Password";
              }
            },
            hintText: 'Password',
            isObscureText: isObsucured,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObsucured = !isObsucured;
                });
              },
              child: Icon(
                isObsucured ? Icons.visibility_off : Icons.visibility,
              ),
            ),
          ),
          verticalHight(24),
          PasswordValidation(
            hasLowerCase: hasLowerCase,
            hasUpperCase: hasUpperCase,
            hasSpecialCharacter: hasSpecialCharacter,
            hasNumber: hasNumber,
            hasMinLenght: hasMinLenght,
          ),
        ],
      ),
    );
  }
}
