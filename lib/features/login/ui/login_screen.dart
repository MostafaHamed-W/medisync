import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medisync/core/helpers/spacing.dart';
import 'package:medisync/core/theming/colors.dart';
import 'package:medisync/core/theming/styles.dart';
import 'package:medisync/core/widgets/custom_text_button.dart';
import 'package:medisync/core/widgets/custom_text_field.dart';
import 'package:medisync/features/login/ui/widgets/already_have_account_text.dart';
import 'package:medisync/features/login/ui/widgets/or_signin_divider.dart';
import 'package:medisync/features/login/ui/widgets/socialmedia_signin_with_icons.dart';
import 'package:medisync/features/login/ui/widgets/terms_and_conditions_terms.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool rememberMe = false;
  bool isObsucured = true;

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
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const CustomTextField(hintText: "Email"),
                      verticalHight(16),
                      CustomTextField(
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
                      verticalHight(16),
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
                      verticalHight(32),
                      CustomTextButton(
                        buttonText: 'Login',
                        buttonTextStyle: TextStyles.font16WhiteSemiBold,
                        onPressed: () {},
                      ),
                      verticalHight(46),
                      const OrSigninDivider(),
                      verticalHight(32),
                      const SocialMediaSigninWithIcons(),
                      verticalHight(32),
                      const TermsAndContidionsText(),
                      verticalHight(24),
                      const AlreadyHaveAccountText()
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
