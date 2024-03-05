import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: Colors.grey.shade900,
    selectionColor: Colors.blue.withOpacity(0.4),
    selectionHandleColor: Colors.blue,
  ),
  colorScheme: ColorScheme.light(
    background: Colors.grey.shade300,
    primary: Colors.grey.shade200,
    secondary: Colors.white,
    inversePrimary: Colors.grey.shade700,
  ),
);
