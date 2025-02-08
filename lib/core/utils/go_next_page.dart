import 'package:flutter/material.dart';
import 'package:flutter_motels_nearby_test/app/views/empty_page.dart';

void goNewPage({String? title, required BuildContext context, Widget? child}) {
  Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => child ?? EmptyPage(title: title)));
}
