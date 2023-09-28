import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Helper_Widgets/movieFilters.dart';
import '../components/Text.dart';

class MovieSearch extends StatefulWidget {
  MovieSearch({super.key});
  @override
  State<MovieSearch> createState() => _MovieSearchState();
}

class _MovieSearchState extends State<MovieSearch> {

  // -------------------------------------------------------------
  List<String> selectedGenres = [];
  // Function to handle genre selection
  void toggleGenreSelection(String genre) {
    setState(() {
      if (selectedGenres.contains(genre)) {
        selectedGenres.remove(genre);
      } else {
        selectedGenres.add(genre);
      }
    });
  }
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
  // -------------------------------------------------------------

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
                  return MovieFilter(
                    imagePath: "assets/${genres[index]}.jpeg",
                    genreName: genres[index],
                    onTap: () {
                      // Call the toggleGenreSelection function when the MovieFilter is tapped
                      toggleGenreSelection(genres[index]);
                    },
                    isSelected: selectedGenres.contains(genres[index]), // Pass isSelected flag for ui changes (YOUNIS)
                  );
                },
                scrollDirection: Axis.horizontal,
              ),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, shape: StadiumBorder()),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                    return Placeholder();
                  },));
                },
                child: CustomText(
                  "Search",
                  size: 24,
                  color: Colors.white,
                )),
          ],
        ),
      ),
    );
  }
}
