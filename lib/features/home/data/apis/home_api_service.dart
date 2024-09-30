import 'package:dio/dio.dart';
import 'package:medisync/core/networking/api_constants.dart';
import 'package:medisync/features/home/data/apis/home_api_constants.dart';
import 'package:medisync/features/home/data/models/specialization_response_model.dart';
import 'package:retrofit/http.dart';
part 'home_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class HomeApiService {
  factory HomeApiService(Dio dio) = _HomeApiService;

  @GET(HomeApiConstants.specializationEP)
  Future<SpecializationResponseModel> getSpecialization();
}
