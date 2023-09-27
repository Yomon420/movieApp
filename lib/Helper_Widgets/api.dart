import 'dart:convert';
import 'package:http/http.dart' as http;

class Api {
  int? year;
  List<String>? withGenres;
  double? voteAverage;
  String? country;
  int? runtime;

  Future<dynamic> get({required String url}) async {
    http.Response res = await http.get(Uri.parse(url));

    if (res.statusCode == 200) {
      return jsonDecode(res.body);
    }
    else {
      throw Exception('Problem with status code: ${res.statusCode}');
    }
  }

  final Map<String, String> headers = {
    "accept": "application/json",
    "Authorization":
    "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4MWEwOGViM2RiMGI2MjBhZGNhZjhhOGZlY2M1Yzg4MCIsInN1YiI6IjY1MGI3NjAzM2Q3NDU0MDBlMTIzNDgwZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.HmB8GR1fK5qsZ_S_OviyjItvlxzmEXV6P35JI18tZ-0",
  };
}