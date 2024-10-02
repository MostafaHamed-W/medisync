import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medisync/features/home/data/models/specialization_response_model.dart';
import 'package:medisync/features/home/logic/home_cubit.dart';
import 'package:medisync/features/home/logic/home_state.dart';
import 'package:medisync/features/home/ui/widgets/doctors_list/doctors_list_shimmers.dart';
import 'package:medisync/features/home/ui/widgets/doctors_list/doctors_listview.dart';

class DoctorsListViewBlocBuilder extends StatelessWidget {
  const DoctorsListViewBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) => current is DoctorsFailure || current is DoctorsSuccess,
      builder: (context, state) {
        return state.maybeWhen(
          specializationsLoading: () => setUpLoading(),
          specializationsSuccess: (specializationsListData) {
            final specializationsList = specializationsListData;
            return setUpSuccess(specializationsList);
          },
          specializationsFailure: (errorHandler) => setUpError(),
          doctorsSuccess: (specializationsListData) {
            final specializationsList = specializationsListData;
            return DoctorsListView(doctors: specializationsList ?? []);
          },
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }

  SizedBox setUpError() => const SizedBox.shrink();

  Widget setUpSuccess(List<SpecializationData?>? specializationsList) {
    return DoctorsListView(doctors: specializationsList?[0]?.doctors ?? []);
  }

  Widget setUpLoading() {
    return const DoctorsShimmerLoading();
  }
}
