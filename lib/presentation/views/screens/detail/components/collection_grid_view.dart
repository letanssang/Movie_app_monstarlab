import 'package:flutter/material.dart';

import '../../../../../domain/entities/movie/movie.dart';

class CollectionGridView extends StatelessWidget {
  final List<Movie> movies;
  final Function onTap;

  const CollectionGridView(
      {required this.movies, required this.onTap, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: GridView.builder(
          itemCount: movies.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 30,
            childAspectRatio: 0.625,
          ),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                onTap(movies[index].id);
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  'https://image.tmdb.org/t/p/w500${movies[index].posterPath}',
                  errorBuilder: (context, error, stackTrace) {
                    return Image.network(
                      'https://image.tmdb.org/t/p/w500${movies[index].backdropPath}',
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.5,
                    );
                  },
                  fit: BoxFit.cover,
                ),
              ),
            );
          }),
    );
  }
}
