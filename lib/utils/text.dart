import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class styled_text extends StatelessWidget {
  styled_text({this.text="Loading", this.color=Colors.white, this.size=10} );
   final String text;
   final Color color;
   final double size;


  @override
  Widget build(BuildContext context) {
    return Text(
      text, style: GoogleFonts.breeSerif(
      color: color,
      fontSize: size,
    ),
    );
  }
}
