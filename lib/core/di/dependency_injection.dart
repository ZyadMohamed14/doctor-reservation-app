import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../feature/home/data/repo/home_repo.dart';
import '../../feature/login/data/repo/login_repo.dart';
import '../../feature/login/logic/logic/cubit/login_cubit.dart';
import '../../feature/signup/data/repo/sign_up_repo.dart';
import '../../feature/signup/domain/sign_up_cubit.dart';
import '../networking/api_service.dart';
import '../networking/dio_factory.dart';


final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  // signup
  getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt()));
  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt()));

  //home
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));
}
