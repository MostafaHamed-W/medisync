import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medisync/core/helpers/spacing.dart';
import 'package:medisync/core/theming/colors.dart';
import 'package:medisync/core/theming/styles.dart';
import 'package:medisync/features/home/data/models/specialization_response_model.dart';

class SpecialityListViewItem extends StatelessWidget {
  const SpecialityListViewItem({
    super.key,
    required this.specializationDataList,
    required this.itemIndex,
    required this.selectedIndex,
  });

  final SpecializationData? specializationDataList;
  final int itemIndex;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: itemIndex == 0 ? 0 : 16.w),
      child: Column(
        children: [
          CircleAvatar(
            radius: 37.h,
            backgroundColor: selectedIndex == itemIndex ? ColorsManager.darkBlue : Colors.transparent,
            child: CircleAvatar(
              radius: 35.h,
              backgroundColor: ColorsManager.defaultGray,
              child: SvgPicture.asset(
                "assets/svgs/general_speciality.svg",
                height: 40,
                width: 40,
              ),
            ),
          ),
          verticalHight(10),
          Text(
            specializationDataList?.name ?? "UnKnown",
            style: TextStyles.font12DarkBlueRegular,
          )
        ],
      ),
    );
  }
}
