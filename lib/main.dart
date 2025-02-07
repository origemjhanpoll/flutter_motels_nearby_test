import 'package:flutter/material.dart';
import 'package:flutter_motels_nearby_test/app/app.dart';
import 'package:flutter_motels_nearby_test/injection.dart' as di;

void main() async {
  await di.init();
  runApp(App());
}
