import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:medisync/core/routing/routes.dart';
import 'package:medisync/core/theming/styles.dart';

class DontHaveAccountText extends StatelessWidget {
  const DontHaveAccountText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Don\'t have an account yet?\t',
                style: TextStyles.font13DarkBlueRegular,
              ),
              TextSpan(
                text: 'Sign Up',
                style: TextStyles.font13BlueSemiBlod,
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.pushNamed(context, Routes.signUpScreen);
                  },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
