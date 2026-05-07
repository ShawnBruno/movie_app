import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:movie_app/models/Movie.dart';

class MovieDetailScreen extends StatelessWidget {
  final Movie movie; // import movie model

  const MovieDetailScreen({super.key, required this.movie}); // constructor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(movie.title)), // AppBar with movie name
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Children of the column
            Stack(
              alignment: Alignment.center,
              children: [
                Image.network(
                  movie.imageUrl,
                  width: double.infinity,
                  height: 350,
                  fit: BoxFit.cover,
                ),
                Positioned.fill(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: Container(
                      color: Colors.black.withValues(
                        alpha: 0.5,
                      ), // optional dark tint
                    ),
                  ),
                ),
                Center(
                  child: Card(
                    elevation: 8,
                    clipBehavior: Clip.antiAlias,
                    // add Hero widget for smooth image transition
                    child:  Image.network(
                        // Display movie image
                        movie.imageUrl,
                        width: 190,
                        height: 280,
                        fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.description,
                    textAlign: TextAlign.justify,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Rating",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Row(
                        children: [
                          buildStarRating(movie.rating),
                          const SizedBox(width: 8),
                          Text(
                            "${movie.rating.toStringAsFixed(1)}/10",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Duration",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Text(
                        movie.duration,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Director",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Text(
                        movie.director,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Producer",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Text(
                        movie.producer,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Release Year",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Text(
                        movie.releaseYear,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    height: 50,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: movie.genres.length,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          width: 120,
                          child: Card(
                            //elevation: 2,
                            margin: const EdgeInsets.symmetric(horizontal: 6),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 8,
                              ),
                              child: Center(
                                child: Text(
                                  movie.genres[index],
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            height: 50,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // TODO: handle watch action
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                "Watch Now",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildStarRating(double rating) {
    final double starRating = rating / 2;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        if (index + 1 <= starRating) {
          return const Icon(Icons.star, color: Colors.amber);
        } else if (index + 0.5 <= starRating) {
          return const Icon(Icons.star_half, color: Colors.amber);
        } else {
          return const Icon(Icons.star_border, color: Colors.amber);
        }
      }),
    );
  }
}
