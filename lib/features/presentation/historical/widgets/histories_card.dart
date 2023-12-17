
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:space_x_task/features/domain/model/histories/histories_model.dart';

Widget historiesCard(HistoryModel? history, BuildContext context) {
  final GlobalKey<ExpansionTileCardState> cardA = GlobalKey();
  return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
          child: ExpansionTileCard(
            key: cardA,
            title: Text(
              history?.title ?? "Unknown",
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      history?.details ?? "Unknown",
                      style: const TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 12.0,
                          color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          )));
}


