import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:movie_app/Helper_Widgets/movieCard.dart';

import '../classes/movieObject.dart';

class MovieSearchResults extends StatelessWidget {
  const MovieSearchResults({super.key, required this.movieResults});
  final List<MovieResult> movieResults;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.redAccent,Colors.black],
            end: Alignment.bottomCenter,
            begin: Alignment.topLeft
          ),
        ),
        child: movieResults == 0 ? Text("Not found") : ListView.builder(
          itemCount: movieResults.length,
            itemBuilder: (context, index) {
              return MovieCard(
                  title: movieResults[index].title,
                  overview: movieResults[index].overview,
                  releaseDate: movieResults[index].releaseDate,
                  voteAverage: movieResults[index].voteAverage,
                  voteCount: movieResults[index].voteCount
              );
            },
        )
      ),
    );
  }
}
