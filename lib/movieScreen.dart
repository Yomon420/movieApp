import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_app/moviePoster.dart';
import 'package:google_fonts/google_fonts.dart';
import 'components/Text.dart';
class MovieScreen extends StatelessWidget {
  const MovieScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: CustomText('Recommended 🤌🏻', color: Colors.cyan,)
            ),
            SizedBox(height: 10,),
            Container(
              width: double.infinity,
              height: 200,
              color: Colors.grey[100],
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return MoviePoster();
                },
                scrollDirection: Axis.horizontal,
              ),
            ),
            SizedBox(height: 40,),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: CustomText("Trending 🔥", color: Colors.purple[300],)
            ),
            SizedBox(height: 10,),
            Container(
              width: double.infinity,
              height: 200,
              color: Colors.grey[100],
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return MoviePoster();
                },
                scrollDirection: Axis.horizontal,
              ),
            ),
            SizedBox(height: 40,),

            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: CustomText("Top Rated 🤩", color: Colors.red,)
            ),
            SizedBox(height: 10,),
            Container(
              width: double.infinity,
              height: 200,
              color: Colors.grey[100],
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return MoviePoster();
                },
                scrollDirection: Axis.horizontal,
              ),

            ),
            SizedBox(height: 40,),

          ],
        ),
      ),
    );
  }
}
