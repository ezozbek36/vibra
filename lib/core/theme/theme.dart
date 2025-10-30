import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract final class VibraTheme {
  static final _baseText = GoogleFonts.inter(
    textStyle: const TextStyle(letterSpacing: -0.25),
  );

  static final light = ThemeData(
    useMaterial3: true,
    colorSchemeSeed: Colors.deepPurpleAccent,
    brightness: Brightness.light,
    textTheme: TextTheme(
      titleMedium: _baseText.copyWith(fontWeight: FontWeight.w600),
      bodyMedium: _baseText,
    ),
  );

  static final dark = ThemeData(
    useMaterial3: true,
    colorSchemeSeed: Colors.deepPurpleAccent,
    brightness: Brightness.dark,
    textTheme: TextTheme(
      titleMedium: _baseText.copyWith(fontWeight: FontWeight.w600),
      bodyMedium: _baseText,
    ),
  );
}
