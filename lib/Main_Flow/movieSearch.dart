import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/Main_Flow/movieSearchResults.dart';

import '../Helper_Widgets/movieFilters.dart';
import '../classes/movieObject.dart';
import '../components/Text.dart';
import '../Helper_Widgets/movieAPI.dart';
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
        physics: const ScrollPhysics(),
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
            SizedBox(height: 100,),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, shape: const StadiumBorder()),
                onPressed: () async {
                  // APPLY ALL THE FILTERS HERE
                  var api = Api(
                    // year: 2024, // THIS WILL SHOW ALL MOVIES BEFORE THIS YEAR
                    withGenres: selectedGenres, // HERE IS MY GENRE FILTER!
                    voteAverage: 7, // THIS WILL SHOW ALL MOVIES ABOVE THIS RATING
                    // country: "US", // ONLY USE ALPHA 2 COUNTRY CODES
                    runtimeChoice: "short", // RUNTIME FILTERS: "normal", "short", "long"
                    page: 1, // Replace with the desired page number
                  );
                  // Here is where all the magic happens
                  var url = api.CallMovieFilterApi();
                  var json = await api.get(url: url);
                  Movie movie = Movie.fromJson(json);
                  List<MovieResult> movieResults = movie.results;

                  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                    return MovieSearchResults(movieResults: movieResults);
                  },));
                },
                child: const CustomText(
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
