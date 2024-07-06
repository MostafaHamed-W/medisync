import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medisync/core/theming/styles.dart';

class MediSyncLogoAndName extends StatelessWidget {
  const MediSyncLogoAndName({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          'assets/svgs/medisync_logo.svg',
          width: 40.w,
        ),
        SizedBox(width: 10.w),
        Text(
          'MediSync',
          style: TextStyles.font24Black700Weight,
        )
      ],
    );
  }
}
