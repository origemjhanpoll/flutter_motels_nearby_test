import 'package:flutter/material.dart';
import 'package:flutter_motels_nearby_test/app/views/motels_list_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Motels Nearby',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: const MotelsListPage(),
    );
  }
}
