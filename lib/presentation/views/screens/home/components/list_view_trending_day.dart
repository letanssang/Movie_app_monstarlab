import 'package:flutter/material.dart';

import '../../../../../domain/entities/movie/movie.dart';

class ListViewTrendingDay extends StatelessWidget {
  const ListViewTrendingDay({
    super.key,
    required this.trendingDay,
  });

  final List<Movie> trendingDay;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height * 0.05, left: 5, right: 5),
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            Navigator.of(context)
                .pushNamed('/detail', arguments: trendingDay[index].id);
          },
          child: AspectRatio(
            aspectRatio: 0.625,
            child: Container(
              margin: const EdgeInsets.only(left: 5, right: 5),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  'https://image.tmdb.org/t/p/w500${trendingDay[index].posterPath}',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
