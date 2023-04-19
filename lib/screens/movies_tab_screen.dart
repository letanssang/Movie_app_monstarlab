import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/movies.dart';

class MoviesTabScreen extends StatefulWidget {
  const MoviesTabScreen({Key? key}) : super(key: key);

  @override
  State<MoviesTabScreen> createState() => _MoviesTabScreenState();
}

class _MoviesTabScreenState extends State<MoviesTabScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Movies>(
        builder: (context, movies, _) => movies.movies.isEmpty
            ? const CircularProgressIndicator()
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                    itemCount: movies.movies.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 30,
                      childAspectRatio: 0.625,
                    ),
                    itemBuilder: (context, item) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed('/detail',
                              arguments: movies.movies[item].id);
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            'https://image.tmdb.org/t/p/w500${movies.movies[item].posterPath}',
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    }),
              ));
  }
}
