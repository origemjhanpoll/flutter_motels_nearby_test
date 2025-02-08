import 'dart:ui';

import 'package:flutter/material.dart';

class IconBlurWidget extends StatelessWidget {
  final Widget child;
  final Color color;
  const IconBlurWidget(
      {super.key, required this.child, this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: 40,
      child: ClipOval(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: DecoratedBox(
            decoration: BoxDecoration(color: color.withValues(alpha: 0.2)),
            child: child,
          ),
        ),
      ),
    );
  }
}
