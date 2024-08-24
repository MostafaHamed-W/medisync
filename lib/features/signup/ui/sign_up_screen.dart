import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medisync/core/helpers/spacing.dart';
import 'package:medisync/core/theming/styles.dart';
import 'package:medisync/core/widgets/custom_text_button.dart';
import 'package:medisync/features/signup/logic/cubit/signup_cubit.dart';
import 'package:medisync/features/signup/ui/signup_bloc_listener.dart';
import 'package:medisync/features/signup/ui/widgets/already_have_account.dart';
import 'package:medisync/features/signup/ui/widgets/signup_form.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalHight(30),
                Text(
                  'Create Account',
                  style: TextStyles.font24BlackBlue,
                ),
                verticalHight(8),
                Text(
                  "Sign up now and start exploring all that our app has to offer. We're excited to welcome you to our community!",
                  style: TextStyles.font14GrayRegular,
                ),
                verticalHight(30),
                Column(
                  children: [
                    const SignupForm(),
                    verticalHight(15),
                    const AlreadyHaveAccountText(),
                    verticalHight(15),
                    CustomTextButton(
                        buttonText: "Create Account",
                        buttonTextStyle: TextStyles.font16WhiteSemiBold,
                        onPressed: () {
                          validateThenDoSignup(context);
                        }),
                    const SignupBlocListener()
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenDoSignup(BuildContext context) {
    if (context.read<SignupCubit>().formKey.currentState!.validate()) {
      context.read<SignupCubit>().emitSignup();
    }
  }
}
