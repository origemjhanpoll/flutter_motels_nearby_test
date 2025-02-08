import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_motels_nearby_test/app/app.dart';
import 'package:flutter_motels_nearby_test/injection.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(App());
  });
}
