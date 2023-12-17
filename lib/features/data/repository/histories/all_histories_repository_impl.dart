import 'dart:io';

import 'package:dio/dio.dart';
import 'package:space_x_task/features/data/remote/dto/all_histories/all_histories.dart';
import 'package:space_x_task/features/data/remote/space_x_api.dart';
import 'package:space_x_task/features/util/resource_state.dart';

import '../../../domain/repository/histories/all_histories_repository.dart';

class AllHistoryRepositoryImpl implements AllHistoriesRepository {
  final SpaceXApiService _spaceXApiService;

  const AllHistoryRepositoryImpl(this._spaceXApiService);


  @override
  Future<ResourceState<List<AllHistoriesResponseDto>>> getAllHistories() async {
    final httpResponse = await _spaceXApiService.getAllHistories();
    try {
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return SuccessResource(httpResponse.data);
      } else {
        return FailureResource(httpResponse.response.statusMessage ?? 'Some Error');
      }
    } on DioError catch (e) {
      return FailureResource(e.message ?? 'Some Error');
    }
  }
}
