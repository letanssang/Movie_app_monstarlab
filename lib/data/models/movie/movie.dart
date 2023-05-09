import 'package:json_annotation/json_annotation.dart';

part 'movie.g.dart';

@JsonSerializable()
class Movie {
  final int? id;
  final String? title;
  @JsonKey(name: 'poster_path')
  final String? posterPath;
  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;
  final String? overview;
  @JsonKey(name: 'release_date')
  final String? releaseDate;
  @JsonKey(name: 'vote_average')
  final double? voteAverage;
  @JsonKey(name: 'vote_count')
  final int? voteCount;
  @JsonKey(name: 'genre_ids')
  final List<int>? genreIds;

  const Movie({
    this.id = 0,
    this.title = '',
    this.posterPath = '',
    this.backdropPath = '',
    this.overview =  '',
    this.releaseDate = '',
    this.voteAverage = 0.0,
    this.voteCount = 0,
    this.genreIds =   const [],
  });

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
}
