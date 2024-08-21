import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medisync/core/helpers/spacing.dart';
import 'package:medisync/core/theming/colors.dart';
import 'package:medisync/core/theming/styles.dart';
import 'package:medisync/core/widgets/custom_text_button.dart';
import 'package:medisync/features/login/data/models/login_request_body.dart';
import 'package:medisync/features/login/logic/cubit/login_cubit.dart';
import 'package:medisync/features/login/ui/widgets/already_have_account_text.dart';
import 'package:medisync/features/login/ui/widgets/email_and_password.dart';
import 'package:medisync/features/login/ui/widgets/login_bloc_listener.dart';
import 'package:medisync/features/login/ui/widgets/or_signin_divider.dart';
import 'package:medisync/features/login/ui/widgets/socialmedia_signin_with_icons.dart';
import 'package:medisync/features/login/ui/widgets/terms_and_conditions_terms.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalHight(50),
                Text(
                  'Welcome Back',
                  style: TextStyles.font24BlackBlue,
                ),
                verticalHight(8),
                Text(
                  "We're excited to have you back, can't wait to see what you've been up to since you last logged in.",
                  style: TextStyles.font14GrayRegular,
                ),
                verticalHight(36),
                Column(
                  children: [
                    const EmailAndPassword(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 9.h),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 18.w,
                            height: 18.h,
                            child: Checkbox(
                              activeColor: ColorsManager.mainBlue,
                              side: const BorderSide(
                                width: 2,
                                color: ColorsManager.checkBoxBorder,
                              ),
                              value: rememberMe,
                              onChanged: (value) {
                                setState(() {
                                  rememberMe = value!;
                                });
                              },
                            ),
                          ),
                          horizentalWidth(9),
                          Text(
                            'Remember me',
                            style: TextStyles.font12BlackGrayMeduim,
                          ),
                          const Spacer(),
                          Text(
                            'Forgot Password?',
                            style: TextStyles.font12BlueRegular,
                          )
                        ],
                      ),
                    ),
                    verticalHight(20),
                    CustomTextButton(
                      buttonText: 'Login',
                      buttonTextStyle: TextStyles.font16WhiteSemiBold,
                      onPressed: () {
                        validateThenDoLogin(context);
                      },
                    ),
                    verticalHight(20),
                    const OrSigninDivider(),
                    verticalHight(20),
                    const SocialMediaSigninWithIcons(),
                    verticalHight(20),
                    const TermsAndContidionsText(),
                    verticalHight(20),
                    const AlreadyHaveAccountText(),
                    const LoginBlocListener()
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenDoLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginStates(
            LoginRequestBody(
              email: context.read<LoginCubit>().loginEmailController.text,
              password: context.read<LoginCubit>().loginPasswordController.text,
            ),
          );
    }
  }

}
