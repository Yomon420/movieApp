import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Helper_Widgets/movieFilters.dart';
import '../components/Text.dart';

class MovieSearch extends StatefulWidget {
  const MovieSearch({super.key});

  @override
  State<MovieSearch> createState() => _MovieSearchState();
}

class _MovieSearchState extends State<MovieSearch> {
  // LIST OF GENRES FOR MANY PURPOSES, GET PICS FROM ASSETS, OUTPUT NAMES
  List<String> genres = [
    'Action',
    'Drama',
    'Comedy',
    'Animation',
    'Fantasy',
    'Horror',
    'War',
    'Romance'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 200,
              child: ListView.builder(
                itemCount: genres.length,
                itemBuilder: (context, index) {
                  return MovieFilter(imagePath: "assets/${genres[index]}.jpeg", genreName: genres[index],);
                },
                scrollDirection: Axis.horizontal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
