import 'dart:ui';

import 'package:flutter/material.dart';

class IconBlurWidget extends StatelessWidget {
  final Widget child;
  final Color color;
  final double size;
  final VoidCallback? onTap;
  const IconBlurWidget({
    super.key,
    required this.child,
    this.color = Colors.white,
    this.size = 40.0,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: onTap != null
            ? BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: theme.colorScheme.onPrimary.withValues(alpha: 0.1),
                  width: 1,
                ),
              )
            : null,
        child: SizedBox.square(
          dimension: size,
          child: ClipOval(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: DecoratedBox(
                decoration: BoxDecoration(
                    color: onTap != null
                        ? Colors.black.withValues(alpha: 0.2)
                        : Colors.white.withValues(alpha: 0.2)),
                child: child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
