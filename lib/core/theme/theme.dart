import 'package:flutter/material.dart';

class ThemeCustom {
  static final theme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      primary: Colors.red,
      seedColor: Colors.red,
    ),
    cardTheme: CardThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.0)),
      color: Colors.white,
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: ButtonStyle(shape: WidgetStatePropertyAll(LinearBorder())),
    ),
  );
}
