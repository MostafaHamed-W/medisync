import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medisync/core/helpers/spacing.dart';
import 'package:medisync/core/theming/colors.dart';
import 'package:medisync/core/theming/styles.dart';

class DoctorsSpecialityListView extends StatelessWidget {
  const DoctorsSpecialityListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      // color: Colors.red,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 8,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsetsDirectional.only(start: index == 0 ? 0 : 16.w),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 35.h,
                  backgroundColor: ColorsManager.defaultGray,
                  child: SvgPicture.asset(
                    "assets/svgs/general_speciality.svg",
                    height: 40,
                    width: 40,
                  ),
                ),
                verticalHight(10),
                Text(
                  "General",
                  style: TextStyles.font12DarkBlueRegular,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
