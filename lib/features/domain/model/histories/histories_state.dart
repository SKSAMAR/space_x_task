import 'package:space_x_task/features/domain/model/common/common_state.dart';
import 'package:space_x_task/features/domain/model/histories/histories_model.dart';
import 'package:space_x_task/features/domain/model/missions/missions_model.dart';


class HistoriesLoading extends CommonState<List<HistoryModel>> {
  const HistoriesLoading();
}

class HistoriesSuccess extends CommonState<List<HistoryModel>> {
  const HistoriesSuccess(List<HistoryModel> histories) : super(data: histories);
}

class HistoriesError extends CommonState<List<HistoryModel>> {
  const HistoriesError(String error) : super(error: error);
}
