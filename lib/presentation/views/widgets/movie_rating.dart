import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../resources/color.dart';

class MovieRating extends StatelessWidget {
  final double voteAverage;

  const MovieRating({required this.voteAverage, Key? key}) : super(key: key);

  double ratingPoint() {
    if (voteAverage <= 1) {
      return 0;
    } else if (voteAverage <= 3) {
      return 1;
    } else if (voteAverage <= 5) {
      return 2;
    } else if (voteAverage <= 7) {
      return 3;
    } else if (voteAverage <= 9) {
      return 4;
    } else {
      return 5;
    }
  }

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating: ratingPoint(),
      itemCount: 5,
      itemSize: 18,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: AppColors.ratedColor,
      ),
      unratedColor: AppColors.unratedColor,
    );
  }
}
