import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medisync/core/theming/styles.dart';

class TermsAndContidionsText extends StatelessWidget {
  const TermsAndContidionsText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: "By logging, you agree to our\t",
        style: TextStyles.font11BlackGrayRegular,
        children: [
          TextSpan(
            text: "Terms & Conditions\t",
            style: TextStyles.font11BlackMeduim,
          ),
          const TextSpan(
            text: "and\n",
          ),
          TextSpan(
            text: "Privacy Policy.",
            style: TextStyles.font11BlackMeduim.copyWith(height: 1.5.h),
          ),
        ],
      ),
    );
  }
}
