import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_x_task/features/domain/model/common/common_state.dart';
import 'package:space_x_task/features/domain/model/missions/missions_event.dart';
import 'package:space_x_task/features/domain/model/missions/missions_model.dart';
import 'package:space_x_task/features/presentation/missions/bloc/all_missions_bloc.dart';

import '../../../data/di/injector.dart';
import '../../../domain/model/missions/missions_state.dart';
import '../widgets/mission_card.dart';

class MissionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('All Missions'),
        ),
        body: _bodyBuilder(),
        floatingActionButton: FloatingActionButton(
          onPressed: () => {_navigateToAllHistory(context)},
          child: const Icon(Icons.manage_history),
        ));
  }

  _bodyBuilder() {
    return BlocProvider<AllMissionsBloc>(
        create: (BuildContext context) =>
            getItInstance()..add(const GetMissions()),
        child: BlocBuilder<AllMissionsBloc, CommonState<List<Missions>>>(
          builder: (_, state) {
            if (state is MissionsLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is MissionsSuccess) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return missionCard(state.data![index]);
                },
                itemCount: state.data!.length,
              );
            } else {
              return Center(child: Text(state.error ?? 'Some Error'));
            }
          },
        ));
  }

  void _navigateToAllHistory(BuildContext context) {
    Navigator.pushNamed(context, '/histories');
  }
}
