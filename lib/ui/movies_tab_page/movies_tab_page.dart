import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../services/movies.dart';


class MoviesTabPage extends ConsumerWidget {
  const MoviesTabPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movies = ref.watch(moviesProvider);
    return Padding(
                padding: const EdgeInsets.all(8.0),
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
