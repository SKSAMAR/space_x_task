import 'package:flutter/material.dart';
import 'package:space_x_task/features/presentation/missions/pages/mission_page.dart';

import 'features/data/di/injector.dart';
import 'features/util/route.dart';

Future<void> main() async {
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SpaceX Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      onGenerateRoute: AppRoutes.onGenerateRoutes,
      home: MissionPage(),
    );
  }
}
