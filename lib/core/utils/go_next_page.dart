import 'package:flutter/material.dart';
import 'package:flutter_motels_nearby_test/app/views/empty_page.dart';

void goNewPage({required String title, required BuildContext context}) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (_) => EmptyPage(title: title)));
}
