import 'package:flutter/material.dart';
import 'package:movie_app/widgets/movie_rating.dart';
import 'package:provider/provider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../models/movies.dart';

class MovieDetailScreen extends StatefulWidget {
  static const routeName = '/detail';

  const MovieDetailScreen({ Key? key}) : super(key: key);

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final id = ModalRoute
        .of(context)!
        .settings
        .arguments as int;
    final movie = Provider.of<Movies>(context).findById(id);
    return Scaffold(
      body: Container(
        width: MediaQuery
            .of(context)
            .size
            .width,
        height: MediaQuery
            .of(context)
            .size
            .height,
        decoration: BoxDecoration(
          color: Color(0xFF716850),
        ),
        child: Column(
          children: [
            Flexible(
              child: Stack(
                children: [
                  Image.network(
                    'https://image.tmdb.org/t/p/w500${movie.backdropPath}',
                    fit: BoxFit.cover,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.5,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0.1, 1],
                        colors: [
                          Colors.transparent,
                          Color(0xFF716850),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.3,
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.2,
                      margin: const EdgeInsets.only(left: 10, bottom: 10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(child: Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              child: Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Column(
                        children: [
                          MovieRating(voteAverage: movie.voteAverage!),
                          Text(movie.title!, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                          Text(movie.releaseDate!, style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),)
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                      child: Column())
                ],
              ),
            )),
            Flexible(child: Container()),
          ],
        ),
      ),
    );
  }
}
