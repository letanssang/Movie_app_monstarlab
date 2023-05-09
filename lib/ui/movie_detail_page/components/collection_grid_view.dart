import 'package:flutter/material.dart';

import '../../../data/models/movie/movie.dart';

class CollectionGridView extends StatelessWidget {
  final List<Movie> movies;
  const CollectionGridView({required this.movies, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, top: 16, right: 8),
      child: GridView.builder(
          itemCount: movies.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 30,
            childAspectRatio: 0.625,
          ),
          itemBuilder: (context, item) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/detail',
                    arguments: movies[item].id);
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  'https://image.tmdb.org/t/p/w500${movies[item].posterPath}',
                  fit: BoxFit.cover,
                ),
              ),
            );
          }),
    );
  }
}
