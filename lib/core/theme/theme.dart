import 'package:flutter/material.dart';

class ThemeCustom {
  static final theme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      primary: Color(0xFF191F29),
      seedColor: Color(0xFF191F29),
      surface: Color(0xFFF0F3F4),
    ),
    cardTheme: CardThemeData(
      elevation: 0.0,
      shape: LinearBorder(),
      color: Colors.white,
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: ButtonStyle(shape: WidgetStatePropertyAll(LinearBorder())),
    ),
  );
}
