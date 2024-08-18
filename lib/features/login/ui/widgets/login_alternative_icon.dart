import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginAlternativeIcon extends StatelessWidget {
  const LoginAlternativeIcon({
    super.key,
    required this.image,
  });

  final String image;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 46,
      height: 46,
      child: CircleAvatar(
        backgroundColor: const Color(0xFFF5F5F5),
        child: Padding(
          padding: EdgeInsets.all(5.w),
          child: Image.asset(image),
        ),
      ),
    );
  }
}
