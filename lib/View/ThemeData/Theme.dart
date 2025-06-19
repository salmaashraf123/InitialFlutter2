import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData GetTheme(){
    return ThemeData(
       primaryColor: Color(0xFFF3D9C7),
       secondaryHeaderColor: Color(0xFF185E3B),
       scaffoldBackgroundColor: Color(0xFF59A67A),
       textTheme: TextTheme(
        displayLarge: GoogleFonts.agdasima(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Color(0xFF185E3B),
        ),
        bodyLarge: GoogleFonts.agdasima(
          fontSize: 15,
          fontWeight: FontWeight.bold,
           color: Colors.white,

        ),
         displayMedium: GoogleFonts.abhayaLibre(
           fontSize: 25,
           fontWeight: FontWeight.bold,
           color: Colors.white,
           backgroundColor: Paint().color = Color(0xFF59A67A),
         ),
      ),
    );
}