
import 'package:space_x_task/features/data/remote/dto/all_histories/all_histories.dart';

import '../../../util/resource_state.dart';

abstract class AllHistoriesRepository {

  Future<ResourceState<List<AllHistoriesResponseDto>>> getAllHistories();

}