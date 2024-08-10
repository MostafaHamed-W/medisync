import 'package:flutter/material.dart';
import 'package:medisync/core/helpers/extensions.dart';
import 'package:medisync/core/routing/routes.dart';
import 'package:medisync/core/theming/colors.dart';
import 'package:medisync/core/theming/styles.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.pushNamed(Routes.loginScreen);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorsManager.mainBlue,
        // To have full control of button
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minimumSize: const Size(double.infinity, 52),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Text(
        'Get Started',
        style: TextStyles.font16WhiteSemiBold,
      ),
    );
  }
}
