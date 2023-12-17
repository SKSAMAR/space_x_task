import 'package:space_x_task/features/data/remote/dto/missions/all_missions_response_dto.dart';

import '../../../util/resource_state.dart';
import '../../repository/missions/all_missions_repository.dart';

class GetAllMissionsUseCase {

  final AllMissionsRepository _allMissionsRepository;
  GetAllMissionsUseCase(this._allMissionsRepository);

  @override
  Future<ResourceState<List<AllMissionsResponseDto>>> getAllMissions() {
    return _allMissionsRepository.getAllMissions();
  }


}
