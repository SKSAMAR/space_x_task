import 'package:space_x_task/features/data/remote/dto/all_histories/all_histories.dart';

import '../../../util/resource_state.dart';
import '../../repository/histories/all_histories_repository.dart';

class GetAllHistoriesUseCase {

  final AllHistoriesRepository _allHistoriesRepository;
  GetAllHistoriesUseCase(this._allHistoriesRepository);

  @override
  Future<ResourceState<List<AllHistoriesResponseDto>>> getAllHistories() {
    return _allHistoriesRepository.getAllHistories();
  }


}
