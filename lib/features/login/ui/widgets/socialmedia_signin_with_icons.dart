import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medisync/features/login/ui/widgets/login_alternative_icon.dart';

class SocialMediaSigninWithIcons extends StatelessWidget {
  const SocialMediaSigninWithIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 80.w),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          LoginAlternativeIcon(image: 'assets/images/google.png'),
          LoginAlternativeIcon(image: 'assets/images/facebook.png'),
          LoginAlternativeIcon(image: 'assets/images/apple.png'),
        ],
      ),
    );
  }
}
