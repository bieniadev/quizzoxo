import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var appTheme = ThemeData(
  fontFamily: GoogleFonts.nunito().fontFamily,
  brightness: Brightness.dark,
  primarySwatch: Colors.deepPurple,
  textTheme: const TextTheme(
    bodyLarge: TextStyle(fontSize: 18, color: Colors.red),
    bodyMedium: TextStyle(fontSize: 20),
    labelLarge: TextStyle(
      letterSpacing: 2,
      fontWeight: FontWeight.bold,
    ),
    displayLarge: TextStyle(fontWeight: FontWeight.bold),
    titleMedium: TextStyle(color: Colors.grey),
    titleLarge: TextStyle(fontSize: 30),
  ),
  buttonTheme: const ButtonThemeData(),
  bottomAppBarTheme: const BottomAppBarTheme(
    color: Colors.black87,
  ),
);
