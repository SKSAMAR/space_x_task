import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:space_x_task/features/domain/model/missions/missions_model.dart';


Widget missionCard(Missions? missions){
  final GlobalKey<ExpansionTileCardState> cardA = GlobalKey();
  return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
          child: ExpansionTileCard(
            key: cardA,
            title: Text(
              missions?.missionName ?? "",
              style: const TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
            children: [
              Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      missions?.description ?? "",
                      style: const TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 12.0,
                          color: Colors.grey),
                    ),
                    const SizedBox(height: 6),
                    const Text('Manufacturer', style: TextStyle(fontWeight: FontWeight.bold),),
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.start,
                      spacing: 8.0, // gap between adjacent chips
                      runSpacing: 4.0, // gap between lines
                      children: missions?.manufacturers?.map((manufacturer) {
                        return Chip(
                          label: Text(manufacturer),
                        );
                      }).toList() ?? [],
                    ),
                  ],
                ),
              ),
            ],
          )
      )
  );
}