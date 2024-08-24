import 'package:flutter/material.dart';
import 'package:medisync/core/helpers/spacing.dart';
import 'package:medisync/core/theming/colors.dart';
import 'package:medisync/core/theming/styles.dart';

class PasswordValidation extends StatelessWidget {
  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasSpecialCharacter;
  final bool hasNumber;
  final bool hasMinLenght;
  final bool? isPasswordIdentical;
  const PasswordValidation(
      {super.key,
      required this.hasLowerCase,
      required this.hasUpperCase,
      required this.hasSpecialCharacter,
      required this.hasNumber,
    required this.hasMinLenght,
    this.isPasswordIdentical,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildValidtionRow('At least 1 lowercase letter', hasLowerCase),
        verticalHight(2),
        buildValidtionRow('At least 1 uppercase letter', hasUpperCase),
        verticalHight(2),
        buildValidtionRow('At least 1 special character', hasSpecialCharacter),
        verticalHight(2),
        buildValidtionRow('At least 1 number', hasNumber),
        verticalHight(2),
        buildValidtionRow('At least 8 characters long', hasMinLenght),
        verticalHight(2),
        isPasswordIdentical != null
            ? buildValidtionRow('Password confirmation should match', isPasswordIdentical!)
            : const SizedBox.shrink()
      ],
    );
  }

  Widget buildValidtionRow(String validationText, bool hasValidated) {
    return Row(
      children: [
        const CircleAvatar(
          backgroundColor: ColorsManager.gray,
          radius: 2.5,
        ),
        horizentalWidth(8),
        Text(
          validationText,
          style: TextStyles.font13DarkBlueRegular.copyWith(
            decoration: hasValidated ? TextDecoration.lineThrough : null,
            decorationColor: Colors.green,
            decorationThickness: 2,
            color: hasValidated ? ColorsManager.gray : ColorsManager.darkBlue,
          ),
        )
      ],
    );
  }
}
