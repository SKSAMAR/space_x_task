import '../../../data/remote/dto/missions/all_missions_response_dto.dart';
import '../../../util/resource_state.dart';

abstract class AllMissionsRepository {

  Future<ResourceState<List<AllMissionsResponseDto>>> getAllMissions();

}