import 'package:flutter/material.dart';
import 'package:medisync/core/theming/styles.dart';

class DoctorSpecialitySeeAll extends StatelessWidget {
  const DoctorSpecialitySeeAll({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Doctor Speciality",
          style: TextStyles.font18DarkBlueBold,
        ),
        Text(
          "See All",
          style: TextStyles.font12BlueRegular,
        )
      ],
    );
  }
}
