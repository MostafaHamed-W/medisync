import 'package:flutter/material.dart';
import 'package:medisync/core/helpers/spacing.dart';
import 'package:medisync/features/home/ui/widgets/specializations_list/speciality_listview_bloc_builder.dart';
import 'package:medisync/features/home/ui/widgets/doctors_list/doctors_listview_bloc_builder.dart';
import 'package:medisync/features/home/ui/widgets/doctor_card.dart';
import 'package:medisync/features/home/ui/widgets/speciality_see_all.dart';
import 'package:medisync/features/home/ui/widgets/home_top_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.fromLTRB(
            20.0,
            16.0,
            20.0,
            28.0,
          ),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const HomeTopBar(),
              const DoctorCard(),
              verticalHight(24),
              const SpecialitySeeAll(),
              verticalHight(16),
              const SpecialityListViewBlocBuilder(),
              verticalHight(10),
              const DoctorsListViewBlocBuilder(),
              // const SpecializationsAndDoctorsBlocBuilder(),
            ],
          ),
        ),
      ),
    );
  }
}


