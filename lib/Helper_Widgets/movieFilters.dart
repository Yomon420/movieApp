import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/Text.dart';

class MovieFilter extends StatelessWidget {
  const MovieFilter(this.imagePath, this.genreName, {super.key});
  final String imagePath;
  final String genreName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.green,
          border: Border.all(color: Colors.black, width: 2.0),
        ),
        child: Column(
          children: [
            Flexible(
              child: Image.asset(imagePath, fit: BoxFit.contain),
            ),
            Text(genreName, style: GoogleFonts.pacifico(
              fontSize: 12,
            ),)
          ],
        ),
      ),
    );
  }
}
