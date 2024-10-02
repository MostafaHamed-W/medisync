import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medisync/core/helpers/spacing.dart';
import 'package:medisync/core/theming/colors.dart';
import 'package:medisync/core/theming/styles.dart';
import 'package:medisync/features/home/data/models/specialization_response_model.dart';

class DoctorListViewItem extends StatelessWidget {
  const DoctorListViewItem({
    super.key,
    required this.doctor,
  });

  final Doctors doctor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 8.w, right: 8.w, bottom: 8.h),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Image.asset(
              height: 110.h,
              width: 110.w,
              fit: BoxFit.cover,
              "assets/images/doctor1.png",
            ),
          ),
          horizentalWidth(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctor.name ?? "",
                  style: TextStyles.font16DarkBlueBold,
                  overflow: TextOverflow.ellipsis,
                ),
                verticalHight(8),
                Text(
                  "${doctor.degree} |  RSUD Gatot Subroto",
                  style: TextStyles.font12GrayMeduim,
                ),
                verticalHight(8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.star,
                      color: ColorsManager.gold,
                    ),
                    horizentalWidth(4),
                    Text(
                      "4.8",
                      style: TextStyles.font12GrayMeduim,
                    ),
                    horizentalWidth(4),
                    Text(
                      "(4,279 reviews)",
                      style: TextStyles.font12GrayMeduim,
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
