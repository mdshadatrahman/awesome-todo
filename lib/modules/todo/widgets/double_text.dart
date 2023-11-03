import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DoubleText extends StatelessWidget {
  const DoubleText({
    required this.text,
    required this.fontSize,
    required this.color,
    required this.backgroundColor,
    required this.fontWeight,
    this.fontStyle = FontStyle.normal,
    super.key,
  });

  final String text;
  final double fontSize;
  final Color color;
  final Color backgroundColor;
  final FontWeight fontWeight;
  final FontStyle fontStyle;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 2,
          child: Text(
            text,
            style: GoogleFonts.roboto(
              color: backgroundColor,
              fontSize: fontSize,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
            ),
          ),
        ),
        Text(
          text,
          style: GoogleFonts.roboto(
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight,
            fontStyle: fontStyle,
          ),
        ),
      ],
    );
  }
}
