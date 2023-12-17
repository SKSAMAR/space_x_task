import 'package:space_x_task/features/domain/model/common/common_state.dart';
import 'package:space_x_task/features/domain/model/missions/missions_model.dart';


class MissionsLoading extends CommonState<List<Missions>> {
  const MissionsLoading();
}

class MissionsSuccess extends CommonState<List<Missions>> {
  const MissionsSuccess(List<Missions> missions) : super(data: missions);
}

class MissionsError extends CommonState<List<Missions>> {
  const MissionsError(String error) : super(error: error);
}
