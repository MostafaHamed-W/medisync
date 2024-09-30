import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medisync/core/helpers/spacing.dart';
import 'package:medisync/features/home/data/models/specialization_response_model.dart';
import 'package:medisync/features/home/logic/home_cubit.dart';
import 'package:medisync/features/home/logic/home_state.dart';
import 'package:medisync/features/home/ui/widgets/doctor_speciality_listview.dart';
import 'package:medisync/features/home/ui/widgets/doctors_listview.dart';

class SpecializationsAndDoctorsBlocBuilder extends StatelessWidget {
  const SpecializationsAndDoctorsBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is SpecializationsLoading || current is SpecializationsSuccess || current is SpecializationsError,
      builder: (context, state) {
        return state.maybeWhen(
          specializationsLoading: () => setUpLoading(),
          specializationsSuccess: (specializationsResponseModel) {
            final specializationsList = specializationsResponseModel.specializationDataList;
            return setUpSuccess(specializationsList);
          },
          specializationsFailure: (errorHandler) => setUpError(),
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }

  SizedBox setUpError() => const SizedBox.shrink();

  Expanded setUpSuccess(List<SpecializationData?>? specializationsList) {
    return Expanded(
      child: Column(
        children: [
          DoctorsSpecialityListView(
            specializationDataList: specializationsList,
          ),
          verticalHight(10),
          DoctorsListView(doctors: specializationsList?[0]?.doctors ?? []),
        ],
      ),
    );
  }

  Widget setUpLoading() {
    return const SizedBox(
      height: 100,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
