import 'package:flutter/material.dart';
import 'package:flutter_motels_nearby_test/app/views/pages/empty_page.dart';

void goNewPage({
  String? title,
  required BuildContext context,
  Widget? child,
  bool fullscreenDialog = false,
}) {
  Navigator.of(context).push(MaterialPageRoute(
      fullscreenDialog: fullscreenDialog,
      builder: (_) => child ?? EmptyPage(title: title)));
}
