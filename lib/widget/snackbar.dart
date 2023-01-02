import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

SnackBar snack_Bar(String text) {
  return SnackBar(
    duration: const Duration(seconds: 3),
    behavior: SnackBarBehavior.floating,
    content: Text(
      text,
      style: GoogleFonts.kufam(
        color: Colors.white,
      ),
    ),
    elevation: 7,
    backgroundColor: Colors.black,
    shape: RoundedRectangleBorder(
      side: const BorderSide(
        width: 2,
        color: Colors.black,
      ),
      borderRadius: BorderRadius.circular(30),
    ),
  );
}
