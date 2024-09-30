import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medisync/features/home/data/repos/home_repo.dart';
import 'package:medisync/features/home/logic/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._homeRepo) : super(const HomeState.initial());
  final HomeRepo _homeRepo;

  void getSpecializations() async {
    emit(const HomeState.specializationsLoading());
    final respnse = await _homeRepo.getSpecializations();
    respnse.when(
      sucess: (specializationResponseModel) => emit(HomeState.specializationsSuccess(specializationResponseModel)),
      failure: (errorHandler) => emit(HomeState.specializationsFailure(errorHandler)),
    );
  }
}
