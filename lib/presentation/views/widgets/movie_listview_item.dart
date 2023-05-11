import 'package:flutter/material.dart';

import '../../../domain/entities/movie/movie.dart';
import 'movie_rating.dart';

class MovieListViewItem extends StatelessWidget {
  final Movie movie;
  final bool isFavorite;
  final Function()? onPressed;
  final bool isSearching;

  const MovieListViewItem(
      {required this.movie,
      this.isFavorite = false,
      this.onPressed,
      this.isSearching = false,
      Key? key})
      : super(key: key);

  double ratingPoint() {
    if (movie.voteAverage == null) {
      return 0;
    }
    if (movie.voteAverage! <= 1) {
      return 0;
    } else if (movie.voteAverage! <= 3) {
      return 1;
    } else if (movie.voteAverage! <= 5) {
      return 2;
    } else if (movie.voteAverage! <= 7) {
      return 3;
    } else if (movie.voteAverage! <= 9) {
      return 4;
    } else {
      return 5;
    }
  }

  String formatString(int num) {
    String str = num.toString();
    if (str.length < 4) {
      return str.padLeft(4);
    }
    return str;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          '/detail',
          arguments: movie.id,
        );
      },
      child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.2,
          margin: const EdgeInsets.only(left: 18, right: 10, bottom: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 1,
                child: AspectRatio(
                  aspectRatio: 0.7,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      'https://image.tmdb.org/t/p/w500/${movie.posterPath}',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 2,
                fit: FlexFit.tight,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(movie.title!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                      MovieRating(voteAverage: movie.voteAverage ?? 0),
                      const SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: Text(
                          movie.overview ?? '',
                          maxLines:
                              MediaQuery.of(context).size.height < 600 ? 2 : 5,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 10),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (!isSearching)
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: onPressed,
                        icon: Icon(
                          Icons.favorite,
                          size: 16,
                          color: isFavorite
                              ? const Color(0xFFBB7152)
                              : const Color(0xFFC1AEA6),
                        )),
                    Text(
                      formatString(movie.voteCount ?? 0),
                      style: const TextStyle(fontSize: 15),
                    ),
                  ],
                ),
            ],
          )),
    );
  }
}
