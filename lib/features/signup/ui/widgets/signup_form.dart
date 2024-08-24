import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medisync/core/helpers/app_regex.dart';
import 'package:medisync/core/helpers/spacing.dart';
import 'package:medisync/core/widgets/custom_text_field.dart';
import 'package:medisync/features/login/ui/widgets/password_validation.dart';
import 'package:medisync/features/signup/logic/cubit/signup_cubit.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasSpecialCharacter = false;
  bool hasNumber = false;
  bool hasMinLenght = false;
  bool isPasswordIdentical = false;
  late TextEditingController passwordController;
  late TextEditingController passwordConfirmationController;
  bool isObsucuredPassword = true;
  bool isObsucuredConfirmation = true;

  @override
  void initState() {
    passwordController = context.read<SignupCubit>().passwordController;
    passwordConfirmationController = context.read<SignupCubit>().passwordConfirmationController;
    setUpPasswordControllerListener();
    setUpPasswordConfirmationControllerListener();
    super.initState();
  }

  void setUpPasswordControllerListener() {
    passwordController.addListener(
      () {
        setState(() {
          hasLowerCase = AppRegex.hasLowerCase(passwordController.text);
          hasUpperCase = AppRegex.hasUpperCase(passwordController.text);
          hasSpecialCharacter = AppRegex.hasSpecialCharacter(passwordController.text);
          hasNumber = AppRegex.hasNumber(passwordController.text);
          hasMinLenght = AppRegex.hasMinLength(passwordController.text);
          isPasswordIdentical =
              AppRegex.isPasswordIdentical(passwordController.text, passwordConfirmationController.text);
        });
      },
    );
  }

  void setUpPasswordConfirmationControllerListener() {
    passwordConfirmationController.addListener(
      () {
        setState(() {
          isPasswordIdentical =
              AppRegex.isPasswordIdentical(passwordController.text, passwordConfirmationController.text);
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignupCubit>().formKey,
      child: Column(
        children: [
          CustomTextField(
            hintText: 'Name',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid name';
              }
            },
            controller: context.read<SignupCubit>().nameController,
          ),
          verticalHight(18),
          CustomTextField(
            hintText: 'Phone',
            validator: (value) {
              if (value == null || value.isEmpty || !AppRegex.isPhoneNumberValid(value)) {
                return 'Please enter a valid phone number';
              }
            },
            controller: context.read<SignupCubit>().phoneController,
          ),
          verticalHight(18),
          CustomTextField(
            hintText: 'Email',
            validator: (value) {
              if (value == null || value.isEmpty || !AppRegex.isEmailValid(value)) {
                return 'Please enter a valid email';
              }
            },
            controller: context.read<SignupCubit>().emailController,
          ),
          verticalHight(18),
          CustomTextField(
            hintText: 'Password',
            isObscureText: isObsucuredPassword,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObsucuredPassword = !isObsucuredPassword;
                });
              },
              child: Icon(
                isObsucuredPassword ? Icons.visibility_off : Icons.visibility,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty || !AppRegex.isPasswordValid(value)) {
                return 'Please enter a valid password';
              }
            },
            controller: context.read<SignupCubit>().passwordController,
          ),
          verticalHight(18),
          CustomTextField(
            hintText: 'Password Confirmation',
            isObscureText: isObsucuredConfirmation,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObsucuredConfirmation = !isObsucuredConfirmation;
                });
              },
              child: Icon(
                isObsucuredConfirmation ? Icons.visibility_off : Icons.visibility,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty || !AppRegex.isPasswordValid(value)) {
                return 'Please enter a valid password';
              } else if (context.read<SignupCubit>().passwordController.text !=
                  context.read<SignupCubit>().passwordConfirmationController.text) {
                return "Password doesn't match!";
              }
            },
            controller: context.read<SignupCubit>().passwordConfirmationController,
          ),
          verticalHight(20),
          PasswordValidation(
            hasLowerCase: hasLowerCase,
            hasUpperCase: hasUpperCase,
            hasSpecialCharacter: hasSpecialCharacter,
            hasNumber: hasNumber,
            hasMinLenght: hasMinLenght,
            isPasswordIdentical: isPasswordIdentical,
          ),
        ],
      ),
    );
  }
}
