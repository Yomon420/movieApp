import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:movie_app/Helper_Widgets/movieCard.dart';

import '../classes/movieObject.dart';

class MovieSearchResults extends StatelessWidget {
  const MovieSearchResults({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(

        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.redAccent,Colors.black],
            end: Alignment.bottomCenter,
            begin: Alignment.topLeft
          ),
        ),
        child: Placeholder() // MovieCard
      ),
    );
  }
}
