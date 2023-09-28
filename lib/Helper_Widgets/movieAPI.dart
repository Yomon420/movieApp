import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../constants.dart';

class Api {
  Api({this.year, this.withGenres, this.voteAverage, this.country,
    this.runtimeChoice, required this.page});

  int? year;
  List<String>? withGenres;
  double? voteAverage;
  String? country;
  String? runtimeChoice;
  int page;

  Future<dynamic> get({required String url}) async {
    // final Map<String, String> headers = {
    //   "accept": "application/json",
    //   "Authorization":
    //   "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4MWEwOGViM2RiMGI2MjBhZGNhZjhhOGZlY2M1Yzg4MCIsInN1YiI6IjY1MGI3NjAzM2Q3NDU0MDBlMTIzNDgwZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.HmB8GR1fK5qsZ_S_OviyjItvlxzmEXV6P35JI18tZ-0",
    // };
    http.Response res = await http.get(Uri.parse(url));

    if (res.statusCode == 200) {
      return jsonDecode(res.body);
    }
    else {
      throw Exception('Problem with status code: ${res.statusCode}');
    }
  }
  String CallMovieFilterApi(){ /// THIS WILL RETURN A URL

    var string = StringBuffer();
    string.write(
        "https://api.themoviedb.org/3/discover/movie?api_key=81a08eb3db0b620adcaf8a8fecc5c880&include_adult=false&include_video=false&language=en-US&page=${page}&sort_by=popularity.desc");

    if (withGenres != null) {
      string.write("&with_genres=");
      for (int i = 0; i < withGenres!.length; i++) {
        string.write(genreIdMap[withGenres![i]]);
        if (i != withGenres!.length - 1) string.write(",");
        print(string.toString());
      }
    }


    if(year != null){
      string.write("&year=${year}");
    }
    /*
     double? voteAverage;
  String? country;
  int? runtime;
     */
    if(voteAverage != null){
      string.write("&vote_average.gte=${voteAverage}");
    }

    // ONLY PASS COUNTRY CODES PLEASE (ALPHA 2) https://www.iban.com/country-codes
    if(country != null){
      string.write("&with_origin_country=${country}");
    }

    if(runtimeChoice != null) {
      if (runtimeChoice == "short") {
        string.write(
            "&with_runtime.lte=60"); // only movies that have less than 60 minutes
      }
      else if (runtimeChoice == "normal") {
        string.write(
            "&with_runtime.lte=200"); // only movies that have less than 150 minutes
      }
      else if (runtimeChoice == "long") {
        string.write(
            "&with_runtime.gte=200"); // only movies that have 200+ minutes
      }
    }
    String finalUrl = string.toString();
    return finalUrl;
  }
}