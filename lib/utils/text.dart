import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFonts {
  static Widget text(BuildContext context, String item, double size,
      FontWeight weight, Color color) {
    return Text(
      textAlign: TextAlign.center,
      item,
      style:
          GoogleFonts.poppins(fontSize: size, fontWeight: weight, color: color),
    );
  }
}
