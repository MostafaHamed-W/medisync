import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medisync/features/home/data/models/specialization_response_model.dart';
import 'package:medisync/features/home/data/repos/home_repo.dart';
import 'package:medisync/features/home/logic/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._homeRepo) : super(const HomeState.initial());
  final HomeRepo _homeRepo;
  List<SpecializationData?>? specializationList = [];
  int selectedIndex = 2;

  void getSpecializations() async {
    emit(const HomeState.specializationsLoading());
    final response = await _homeRepo.getSpecializations();
    response.when(
      success: (specializationsRespnse) {
        specializationList = specializationsRespnse.specializationDataList;
        // Get the first specialization doctors list
        getDoctorsList(specializationList?[2]?.id);
        emit(HomeState.specializationsSuccess(specializationsRespnse.specializationDataList ?? []));
      },
      failure: (apiErrorModel) => emit(HomeState.specializationsFailure(apiErrorModel)),
    );
  }

  List<Doctors>? getSpecializationByID(int? specializationID) {
    return specializationList?.firstWhere((specialization) => specialization?.id == specializationID)?.doctors;
  }

  void getDoctorsList(int? specializationID) {
    List<Doctors>? doctorsList = getSpecializationByID(specializationID);
    if (doctorsList == null || doctorsList.isEmpty) {
      emit(const HomeState.doctorsFailure());
    } else {
      emit(HomeState.doctorsSuccess(doctorsList));
    }
  }
}
