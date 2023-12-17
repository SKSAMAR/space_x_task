import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_x_task/features/domain/model/histories/histories_event.dart';
import 'package:space_x_task/features/domain/model/histories/histories_model.dart';
import 'package:space_x_task/features/domain/model/histories/histories_state.dart';
import 'package:space_x_task/features/presentation/historical/bloc/all_histories_bloc.dart';

import '../../../data/di/injector.dart';
import '../../../domain/model/common/common_state.dart';
import '../widgets/histories_card.dart';


class HistoriesPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Histories'),
      ),
      body: _bodyBuilder(),
    );
  }


  _bodyBuilder() {
    return BlocProvider<AllHistoriesBloc>(
        create: (BuildContext context) => getItInstance()..add(const GetHistories()),
        child: BlocBuilder<AllHistoriesBloc, CommonState<List<HistoryModel>>>(
          builder: (_, state) {
            if (state is HistoriesLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is HistoriesSuccess) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return historiesCard(state.data![index], context);
                },
                itemCount: state.data!.length,
              );
            } else {
              return Center(child: Text(state.error ?? 'Some Error'));
            }
          },
        ));
  }

}
