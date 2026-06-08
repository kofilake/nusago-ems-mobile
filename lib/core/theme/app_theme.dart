import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  
  static const Color primaryRed = Color(0xFFC8102E);
  static const Color whiteBackground = Color(0xFFFFFFFF);
  static const Color inputFill = Color(0xFFF4F5F7);
  
  static const Color textPrimary = Color(0xFF222222);
  
  static const Color textSecondary = Color(0xCC222222); 
  
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: whiteBackground,
      primaryColor: primaryRed,
      
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryRed,
        primary: primaryRed,
      ),
      
      textTheme: GoogleFonts.robotoTextTheme().apply(
        bodyColor: textPrimary,
        displayColor: textPrimary,
      ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: primaryRed,
        selectionHandleColor: primaryRed,
      ),
      
      appBarTheme: const AppBarTheme(
        backgroundColor: whiteBackground,
        elevation: 0,
        iconTheme: IconThemeData(color: textPrimary),
        titleTextStyle: TextStyle(
          color: textPrimary,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        scrolledUnderElevation: 0, 
        surfaceTintColor: Colors.transparent,
      ),
      
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: inputFill,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: primaryRed, width: 1.5),
        ),
        hintStyle: const TextStyle(color: textSecondary, fontSize: 14),
        labelStyle: const TextStyle(
          color: textPrimary, 
          fontSize: 14, 
          fontWeight: FontWeight.w500, 
        ),
        
        floatingLabelStyle: const TextStyle(
          color: primaryRed, 
          fontSize: 14, 
          fontWeight: FontWeight.w600, 
        ),
      ),
      
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryRed,
          foregroundColor: whiteBackground,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          textStyle: GoogleFonts.roboto(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
      ),
    );
  }
}