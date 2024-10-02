import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medisync/core/helpers/spacing.dart';
import 'package:medisync/core/theming/colors.dart';
import 'package:shimmer/shimmer.dart';

class SpecialityShimmerLoading extends StatelessWidget {
  const SpecialityShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.h,
      // color: Colors.red,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 8,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsetsDirectional.only(start: 16.w),
            child: Column(
              children: [
                Shimmer.fromColors(
                  baseColor: ColorsManager.lightGray,
                  highlightColor: Colors.white,
                  child: CircleAvatar(
                    radius: 37.h,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 35.h,
                      backgroundColor: ColorsManager.defaultGray,
                      child: Container(
                        height: 40,
                        width: 40,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                verticalHight(10),
                Shimmer.fromColors(
                  baseColor: ColorsManager.lightGray,
                  highlightColor: Colors.white,
                  child: Container(
                    height: 18.h,
                    width: 50.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
