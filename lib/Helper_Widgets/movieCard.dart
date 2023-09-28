import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  final String title;
  final String overview;
  final String releaseDate;
  final double voteAverage;
  final int voteCount;
  final String? posterPath; // New property for the movie poster path (OPTIONAL FOR NOW)

  MovieCard({
    required this.title,
    required this.overview,
    required this.releaseDate,
    required this.voteAverage,
    required this.voteCount,
    this.posterPath, // Initialize with the movie poster path
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Movie Poster
          Image.asset(
            posterPath ?? 'assets/Comedy.jpeg', // OPTIONAL (FOR NOW)
            width: double.infinity,
            height: 200, // Adjust the height as needed
            fit: BoxFit.cover, // Maintain aspect ratio and cover the container
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  'Release Date: $releaseDate',
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text('Ratings: $voteAverage', style: const TextStyle(fontSize: 16)),
                    const SizedBox(width: 2,),
                    const Icon(Icons.star, size: 22,),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  'Number of votes: $voteCount',
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Overview:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  overview.length <= 320 ? overview : overview.substring(0,320) +"...", // Truncate string if its too long
                  style: const TextStyle(fontSize: 16),
                  
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
