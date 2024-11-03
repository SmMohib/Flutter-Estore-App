import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
customText(String text, double size, Color color, FontWeight fontWeight) {
  return Text(text,style: GoogleFonts.roboto(
    fontSize: size,
    color: color,
    fontWeight: fontWeight,
  ),);
}