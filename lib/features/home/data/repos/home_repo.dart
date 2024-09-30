import 'package:medisync/core/networking/api_error_handler.dart';
import 'package:medisync/core/networking/api_result.dart';
import 'package:medisync/features/home/data/apis/home_api_service.dart';
import 'package:medisync/features/home/data/models/specialization_response_model.dart';

class HomeRepo {
  final HomeApiService _homeApiService;
  HomeRepo(this._homeApiService);

  Future<ApiResult<SpecializationResponseModel>> getSpecializations() async {
    try {
      final response = await _homeApiService.getSpecialization();
      return ApiResult.sucess(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
