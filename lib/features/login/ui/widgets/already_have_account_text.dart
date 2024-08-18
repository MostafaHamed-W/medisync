import 'package:flutter/material.dart';
import 'package:medisync/core/theming/styles.dart';

class AlreadyHaveAccountText extends StatelessWidget {
  const AlreadyHaveAccountText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          textAlign: TextAlign.center,
          'Already have an account yet?\t',
          style: TextStyles.font11BlackRegular,
        ),
        Text(
          'Sign Up',
          style: TextStyles.font11BlueRegular,
        )
      ],
    );
  }
}
