import 'package:flutter/material.dart';

class BackButtonCustomWidget extends BackButton {
  const BackButtonCustomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox.square(
      child: BackButton(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(theme.colorScheme.primary),
          iconSize: WidgetStatePropertyAll(20.0),
          iconColor: WidgetStatePropertyAll(theme.colorScheme.onPrimary),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
        ),
      ),
    );
  }
}
