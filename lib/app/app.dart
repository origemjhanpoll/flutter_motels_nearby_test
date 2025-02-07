import 'package:flutter/material.dart';
import 'package:flutter_motels_nearby_test/app/views/motels_list_page.dart';
import 'package:flutter_motels_nearby_test/core/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Motels Nearby',
      debugShowCheckedModeBanner: false,
      theme: ThemeCustom.theme,
      home: const MotelsListPage(),
    );
  }
}
