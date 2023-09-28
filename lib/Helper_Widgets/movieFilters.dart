import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/Text.dart';
import 'package:movie_app/Main_Flow/movieSearch.dart';
class MovieFilter extends StatelessWidget {
  const MovieFilter({super.key,
    required this.imagePath,
    required this.genreName,
    required this.onTap,
    required this.isSelected, // Optional: Initialize isSelected flag
  });
  final String imagePath;
  final String genreName;
  final VoidCallback onTap;
  final bool isSelected;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
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
            Text(isSelected ? "${genreName} selected" : genreName, style: GoogleFonts.pacifico(
              fontSize: 12,
            ),)
          ],
        ),
      ),
    );
  }
}
