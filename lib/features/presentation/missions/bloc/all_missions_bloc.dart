import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_x_task/features/domain/model/common/common_state.dart';
import 'package:space_x_task/features/domain/model/missions/missions_event.dart';
import 'package:space_x_task/features/domain/model/missions/missions_state.dart';
import '../../../domain/model/missions/missions_model.dart';
import '../../../domain/usecases/histories/get_all_histories_usecase.dart';
import '../../../util/resource_state.dart';

class AllMissionsBloc extends Bloc<MissionsEvents, CommonState<List<Missions>>> {

  final GetAllMissionsUseCase _getAllMissionsUseCase;
  AllMissionsBloc(this._getAllMissionsUseCase) : super(const MissionsLoading()) {
    on<GetMissions>(onGetMissions);
  }

  void onGetMissions(GetMissions event, Emitter<CommonState<List<Missions>>> emit) async {
    final state = await _getAllMissionsUseCase.getAllMissions();
    if (state is SuccessResource && state.data!.isNotEmpty) {
      emit(MissionsSuccess(state.data!));
    } else if (state is FailureResource) {
      emit(MissionsError(state.error!));
    }
  }
}
