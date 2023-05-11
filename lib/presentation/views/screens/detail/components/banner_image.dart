import 'package:flutter/material.dart';

import '../../../resources/color.dart';

class BannerImage extends StatelessWidget {
  final String backdropPath;
  final String posterPath;

  const BannerImage(
      {required this.backdropPath, required this.posterPath, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          'https://image.tmdb.org/t/p/w500$backdropPath',
          errorBuilder: (context, error, stackTrace) {
            return Image.network(
              'https://image.tmdb.org/t/p/w500$posterPath',
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.5,
            );
          },
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.5,
        ),
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.1, 1],
              colors: [
                Colors.transparent,
                AppColors.mainColor,
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.3,
            height: MediaQuery.of(context).size.height * 0.2,
            margin: const EdgeInsets.only(left: 10, bottom: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network('https://image.tmdb.org/t/p/w500$posterPath',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                return Image.network(
                  'https://image.tmdb.org/t/p/w500$backdropPath',
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.5,
                );
              }),
            ),
          ),
        ),
      ],
    );
  }
}
