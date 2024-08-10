import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medisync/core/theming/styles.dart';
import 'package:medisync/features/onboarding/widgets/doctor_image_and_text.dart';
import 'package:medisync/features/onboarding/widgets/get_started_button.dart';
import 'package:medisync/features/onboarding/widgets/medisync_logo_and_name.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 30.h, bottom: 30.h),
            child: Column(
              children: [
                const MediSyncLogoAndName(),
                SizedBox(height: 30.h),
                const DoctorImageAndText(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    children: [
                      Text(
                        'Manage and schedule all of your medical appointments easily\nwith Docdoc to get a new experience.',
                        textAlign: TextAlign.center,
                        style: TextStyles.font11GrayRegular,
                      ),
                      SizedBox(height: 30.h),
                      const GetStartedButton(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
