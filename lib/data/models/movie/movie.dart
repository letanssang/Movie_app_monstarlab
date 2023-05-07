import 'package:freezed_annotation/freezed_annotation.dart';
part 'movie.freezed.dart';
part 'movie.g.dart';

@freezed
class Movie with _$Movie{

  const factory Movie(
      { bool? adult,
        @JsonKey(name: 'backdrop_path') String? backdropPath,
        @JsonKey(name: 'overview') String? overview,
        @JsonKey(name: 'genre_ids')List<int>? genreIds,
        @JsonKey(name: 'original_language') String? originalLanguage,
        @JsonKey(name: 'original_title')String? originalTitle,
        @JsonKey(name: 'id') int? id,
        @JsonKey(name: 'video') bool? video,
        @JsonKey(name: 'vote_average') double? voteAverage,
        @JsonKey(name: 'title') String? title,
        @JsonKey(name: 'vote_count') int? voteCount,
        @JsonKey(name: 'release_date') String? releaseDate,
        @JsonKey(name: 'poster_path')String? posterPath,
        @JsonKey(name: 'popularity') double? popularity,
        @JsonKey(name: 'media_type') String? mediaType}) = _Movie;
  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
}
