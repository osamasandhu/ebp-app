import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme {
    return ThemeData(
      textTheme: GoogleFonts.poppinsTextTheme(),
      appBarTheme: const AppBarTheme(
        color: AppColors.blueColor,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
      ),
    );
  }
}

class AppColors {
  AppColors._();

  static const blueColor = Color(0xFF0B3167);
  static const orangeColor = Color(0xFFFE6D00);
  static const greenColor = Color(0xFF1DBF73);
  static const lightBlack = Color(0xFF383838);
}
