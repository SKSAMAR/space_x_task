import 'package:flutter/material.dart';
import 'package:space_x_task/features/presentation/historical/pages/histories_page.dart';
import 'package:space_x_task/features/presentation/missions/pages/mission_page.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(MissionPage());
        case '/mission':
        return _materialRoute(MissionPage());
      case '/histories':
        return _materialRoute(HistoriesPage());
      default:
        return _materialRoute(MissionPage());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
