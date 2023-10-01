import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/Main_Flow/movieSearchResults.dart';
import '../Helper_Widgets/movieFilters.dart';
import '../classes/movieObject.dart';
import '../components/Text.dart';
import '../Helper_Widgets/movieAPI.dart';

class MovieSearch extends StatefulWidget {
  const MovieSearch({super.key});
  @override
  State<MovieSearch> createState() => _MovieSearchState();
}

class _MovieSearchState extends State<MovieSearch> {
  // -------------------------------------------------------------
  List<String> selectedGenres = [];
  String? selectedLanguage;
  bool? isSelected = false;
  // Function to handle genre selection

  void toggleLanguageSelection(String language){
    setState(() {
      selectedLanguage = language;
      if(!isSelected!){
        isSelected = true;
        print("Selected Language: $selectedLanguage");
      }
      else if(isSelected!){
        isSelected = false;
        print("Unselected Language: $selectedLanguage");
      }
    });
  }

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
    'Fantasy',
    'Comedy',
    'Animation',
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
                        imagePath: selectedGenres.contains(genres[index]) ? "assets/${genres[index]}_selected.png" : "assets/${genres[index]}.png",
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
                Container(
                  width: double.infinity,
                  height: 200,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      MovieFilter(
                        imagePath: "assets/USA.png",
                        onTap: (){
                          toggleLanguageSelection("en");
                        },
                        isSelected: selectedLanguage == "en",
                      ),
                      MovieFilter(
                        imagePath: "assets/ARABIC.jpg",
                        onTap: (){
                          toggleLanguageSelection("ar");
                        },
                        isSelected: selectedLanguage == "ar",
                      ),
                      MovieFilter(
                        imagePath: "assets/KO.png",
                        onTap: (){
                          toggleLanguageSelection("ko");
                        },
                        isSelected: selectedLanguage == "ko",
                      ),
                      MovieFilter(
                        imagePath: "assets/INDIA.png",
                        onTap: (){
                          toggleLanguageSelection("hi");
                        },
                        isSelected: selectedLanguage == "hi",
                      ),
                      MovieFilter(
                        imagePath: "assets/JAPAN.png",
                        onTap: (){
                          toggleLanguageSelection("ja");
                        },
                        isSelected: selectedLanguage == "ja",
                      ),
                      MovieFilter(
                        imagePath: "assets/FRANCE.png",
                        onTap: (){
                          toggleLanguageSelection("fr");
                        },
                        isSelected: selectedLanguage == "fr",
                      ),
                      MovieFilter(
                        imagePath: "assets/SPAIN.png",
                        onTap: (){
                          toggleLanguageSelection("es");
                        },
                        isSelected: selectedLanguage == "es",

                      ),
                      MovieFilter(
                        imagePath: "assets/OTHER.jpg",
                        onTap: (){
                          toggleLanguageSelection("other");
                        },
                        isSelected: selectedLanguage == "other",
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue, shape: const StadiumBorder()),
                    onPressed: () async {
                      // APPLY ALL THE FILTERS HERE
                      var api = Api(
                        year: 2018,
                        withGenres: selectedGenres,
                        voteAverage: 2,
                        runtimeChoice: "normal",
                        language: selectedLanguage,
                        page: 1,
                      );
                      // Here is where all the magic happens
                      var url = api.CallMovieFilterApi();
                      var json = await api.get(url: url);
                      Movie movie = Movie.fromJson(json);
                      List<MovieResult> movieResults = movie.results;

                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return MovieSearchResults(movieResults: movieResults);
                        },
                      ));
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