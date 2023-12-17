import 'dart:io';

import 'package:dio/dio.dart';
import 'package:space_x_task/features/data/remote/dto/missions/all_missions_response_dto.dart';
import 'package:space_x_task/features/data/remote/space_x_api.dart';
import 'package:space_x_task/features/domain/repository/missions/all_missions_repository.dart';
import 'package:space_x_task/features/util/resource_state.dart';

class AllMissionsRepositoryImpl implements AllMissionsRepository {
  final SpaceXApiService _spaceXApiService;

  const AllMissionsRepositoryImpl(this._spaceXApiService);

  @override
  Future<ResourceState<List<AllMissionsResponseDto>>> getAllMissions() async {
    final httpResponse = await _spaceXApiService.getAllMissions();
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
