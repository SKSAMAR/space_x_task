import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:space_x_task/features/data/remote/dto/all_histories/all_histories.dart';
import '../../util/constant.dart';
import 'dto/missions/all_missions_response_dto.dart';

part 'space_x_api.g.dart';

@RestApi(baseUrl: apiBaseUrl)
abstract class SpaceXApiService {
  factory SpaceXApiService(Dio dio) = _SpaceXApiService;

  @GET('/missions')
  Future<HttpResponse<List<AllMissionsResponseDto>>> getAllMissions();

  @GET('/history')
  Future<HttpResponse<List<AllHistoriesResponseDto>>> getAllHistories();

}
