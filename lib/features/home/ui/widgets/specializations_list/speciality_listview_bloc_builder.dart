import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medisync/features/home/data/models/specialization_response_model.dart';
import 'package:medisync/features/home/logic/home_cubit.dart';
import 'package:medisync/features/home/logic/home_state.dart';
import 'package:medisync/features/home/ui/widgets/specializations_list/speciality_listview.dart';
import 'package:medisync/features/home/ui/widgets/specializations_list/speciality_shimmer_loading.dart';

class SpecialityListViewBlocBuilder extends StatelessWidget {
  const SpecialityListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is SpecializationsLoading || current is SpecializationsSuccess || current is SpecializationsError,
      builder: (context, state) {
        return state.maybeWhen(
          specializationsLoading: () => setUpLoading(),
          specializationsSuccess: (specializationsListData) => setUpSuccess(specializationsListData),
          specializationsFailure: (errorHandler) => setUpError(),
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }

  // Define success body of speciality list view
  Widget setUpSuccess(List<SpecializationData?>? specializationsListData) {
    final specializationsList = specializationsListData;
    return SpecialityListView(
      specializationDataList: specializationsList,
    );
  }

  // Define erroer handler with custom error widget
  SizedBox setUpError() => const SizedBox.shrink();

  // Define loading handler with custom loading widget
  Widget setUpLoading() {
    return const SpecialityShimmerLoading();
  }
}
