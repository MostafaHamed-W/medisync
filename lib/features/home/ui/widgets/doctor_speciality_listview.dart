import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medisync/core/helpers/spacing.dart';
import 'package:medisync/core/theming/colors.dart';
import 'package:medisync/core/theming/styles.dart';
import 'package:medisync/features/home/data/models/specialization_response_model.dart';

class DoctorsSpecialityListView extends StatelessWidget {
  const DoctorsSpecialityListView({super.key, required this.specializationDataList});

  final List<SpecializationData?>? specializationDataList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      // color: Colors.red,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: specializationDataList?.length,
        itemBuilder: (BuildContext context, int index) {
          return DoctorsSpecialityListViewItem(
              specializationDataList: specializationDataList?[index], itemIndex: index);
        },
      ),
    );
  }
}

class DoctorsSpecialityListViewItem extends StatelessWidget {
  const DoctorsSpecialityListViewItem({
    super.key,
    required this.specializationDataList,
    required this.itemIndex,
  });

  final SpecializationData? specializationDataList;
  final int itemIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: itemIndex == 0 ? 0 : 16.w),
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
            specializationDataList?.name ?? "UnKnown",
            style: TextStyles.font12DarkBlueRegular,
          )
        ],
      ),
    );
  }
}
