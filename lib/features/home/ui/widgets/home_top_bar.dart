import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medisync/core/theming/colors.dart';
import 'package:medisync/core/theming/styles.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi, Mostafa!',
              style: TextStyles.font18DarkBlueBold,
            ),
            Text(
              "How Are you Today?",
              style: TextStyles.font12SemiDarkGrayRegular,
            ),
          ],
        ),
        const Spacer(),
        CircleAvatar(
          backgroundColor: ColorsManager.moreLighterGray,
          radius: 28.0,
          child: Badge.count(
            count: 3,
            backgroundColor: ColorsManager.red,
            child: SvgPicture.asset(
              "assets/svgs/alert.svg",
              width: 24.0,
            ),
          ),
        )
      ],
    );
  }
}
