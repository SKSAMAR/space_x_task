import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:space_x_task/features/data/remote/space_x_api.dart';
import 'package:space_x_task/features/data/repository/histories/all_histories_repository_impl.dart';
import 'package:space_x_task/features/data/repository/missions/all_missions_repository_impl.dart';
import 'package:space_x_task/features/domain/repository/histories/all_histories_repository.dart';
import 'package:space_x_task/features/domain/repository/missions/all_missions_repository.dart';
import 'package:space_x_task/features/domain/usecases/missions/get_all_missions_usecase.dart';
import 'package:space_x_task/features/presentation/historical/bloc/all_histories_bloc.dart';
import 'package:space_x_task/features/presentation/missions/bloc/all_missions_bloc.dart';

import '../../domain/usecases/histories/get_all_histories_usecase.dart';

final getItInstance = GetIt.instance;

Future<void> initializeDependencies() async {
  //Dependencies
  var dio = Dio();
  dio.interceptors.add(PrettyDioLogger());

  // Dio
  getItInstance.registerSingleton<Dio>(dio);
  // SpaceXApiService
  getItInstance.registerSingleton<SpaceXApiService>(SpaceXApiService(getItInstance()));


  //AllMissionsRepository
  getItInstance.registerSingleton<AllMissionsRepository>(AllMissionsRepositoryImpl(getItInstance()));
  // AllMissionUseCase
  getItInstance.registerSingleton<GetAllMissionsUseCase>(GetAllMissionsUseCase(getItInstance()));
  // Missions Bloc
  getItInstance.registerFactory<AllMissionsBloc>(() => AllMissionsBloc(getItInstance()));


  //AllHistoriesRepository
  getItInstance.registerSingleton<AllHistoriesRepository>(AllHistoryRepositoryImpl(getItInstance()));
  // AllHistoriesUseCase
  getItInstance.registerSingleton<GetAllHistoriesUseCase>(GetAllHistoriesUseCase(getItInstance()));
  // Histories Bloc
  getItInstance.registerFactory<AllHistoriesBloc>(() => AllHistoriesBloc(getItInstance()));


}
