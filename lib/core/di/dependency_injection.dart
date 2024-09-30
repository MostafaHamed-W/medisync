import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:medisync/core/networking/api_service.dart';
import 'package:medisync/core/networking/dio_factory.dart';
import 'package:medisync/features/home/data/apis/home_api_service.dart';
import 'package:medisync/features/home/data/repos/home_repo.dart';
import 'package:medisync/features/login/data/repos/login_repo.dart';
import 'package:medisync/features/login/logic/cubit/login_cubit.dart';
import 'package:medisync/features/signup/data/repos/signup_repo.dart';
import 'package:medisync/features/signup/logic/cubit/signup_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & Api Service
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));


  //* We made the Cubits ((Only Cubits)) => (registerFactory) not (registerLazySingleton), bsecause (lazySingelton) will make one instance
  //* Then if we disposed that instance it will cause an error because the controllers inside the cubit will be disposed
  //* But (registerFactory) will make an instance when we want to use the cubit
  //* And we know that cubits are lazy instances as we do not consume resources when we do this because cubits are lazy
  //* As when we want to use it again it will be mounted, and it distroys itself when it's no longer used

  // Login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  // Signup
  getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt()));
  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt()));

  // Home
  getIt.registerLazySingleton<HomeApiService>(() => HomeApiService(dio));
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));
}
