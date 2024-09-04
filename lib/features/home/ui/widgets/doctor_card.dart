import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medisync/core/helpers/spacing.dart';
import 'package:medisync/core/theming/styles.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 198.h,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 167.h,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/blue_card.png'),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Book and\nscedule with\nNearest doctor',
                    style: TextStyles.font18WhiteMeduim,
                  ),
                  verticalHight(10.h),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(),
                    child: const Text('Find Nearby'),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 15.w,
            child: SizedBox(
              height: 198.h,
              child: Image.asset("assets/images/doctor2.png"),
            ),
          ),
        ],
      ),
    );
  }
}
