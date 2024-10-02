import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medisync/core/helpers/spacing.dart';
import 'package:medisync/core/theming/colors.dart';
import 'package:shimmer/shimmer.dart';

class DoctorsShimmerLoading extends StatelessWidget {
  const DoctorsShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 8,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.only(left: 8.w, right: 8.w, bottom: 8.h),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Shimmer.fromColors(
                    baseColor: ColorsManager.lightGray,
                    highlightColor: Colors.white,
                    child: Container(
                      height: 110.h,
                      width: 110.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                horizentalWidth(16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Shimmer.fromColors(
                        baseColor: ColorsManager.lightGray,
                        highlightColor: Colors.white,
                        child: Container(
                          height: 18.h,
                          width: 185.w,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      verticalHight(8),
                      Shimmer.fromColors(
                        baseColor: ColorsManager.lightGray,
                        highlightColor: Colors.white,
                        child: Container(
                          height: 18.h,
                          width: 170.w,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      verticalHight(8),
                      Shimmer.fromColors(
                        baseColor: ColorsManager.lightGray,
                        highlightColor: Colors.white,
                        child: Container(
                          height: 14.h,
                          width: 170.w,
                          decoration: BoxDecoration(
                            color: ColorsManager.lightGray,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
