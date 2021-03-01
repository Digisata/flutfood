import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget({
    @required this.text,
    @required this.color,
    Key key,
    this.fontSize = 20.0,
    this.maxLines = 1,
    this.textAlign = TextAlign.start,
    this.fontWeight = FontWeight.normal,
    this.isUderline = false,
  }) : super(key: key);

  final String text;
  final Color color;
  final double fontSize;
  final int maxLines;
  final TextAlign textAlign;
  final FontWeight fontWeight;
  final bool isUderline;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      textAlign: textAlign,
      textDirection: TextDirection.ltr,
      style: GoogleFonts.openSans(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontStyle: FontStyle.normal,
        decoration: isUderline ? TextDecoration.underline : TextDecoration.none,
      ),
    );
  }
}
