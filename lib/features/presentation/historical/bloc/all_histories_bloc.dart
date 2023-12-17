import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_x_task/features/domain/model/common/common_state.dart';
import 'package:space_x_task/features/domain/model/histories/histories_event.dart';
import 'package:space_x_task/features/domain/model/histories/histories_model.dart';
import 'package:space_x_task/features/domain/usecases/missions/get_all_missions_usecase.dart';
import '../../../domain/model/histories/histories_state.dart';
import '../../../util/resource_state.dart';

class AllHistoriesBloc extends Bloc<HistoriesEvents, CommonState<List<HistoryModel>>> {

  final GetAllHistoriesUseCase _getAllHistoriesUseCase;
  AllHistoriesBloc(this._getAllHistoriesUseCase) : super( const HistoriesLoading()) {
    on<GetHistories>(onGetHistories);
  }

  void onGetHistories(GetHistories event, Emitter<CommonState<List<HistoryModel>>> emit) async {
    final state = await _getAllHistoriesUseCase.getAllHistories();
    if (state is SuccessResource && state.data!.isNotEmpty) {
      emit(HistoriesSuccess(state.data!));
    } else if (state is FailureResource) {
      emit(HistoriesError(state.error!));
    }
  }
}
