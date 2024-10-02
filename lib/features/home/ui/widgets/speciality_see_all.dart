import 'package:flutter/material.dart';
import 'package:medisync/core/theming/styles.dart';

class SpecialitySeeAll extends StatelessWidget {
  const SpecialitySeeAll({super.key});

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
