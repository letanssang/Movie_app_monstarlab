class Movie {
  final bool? adult;
  final String? backdropPath;
  final String? overview;
  final List<int>? genreIds;
  final String? originalLanguage;
  final String? originalTitle;
  final int? id;
  final bool? video;
  final double? voteAverage;
  final String? title;
  final int? voteCount;
  final String? releaseDate;
  final String? posterPath;
  final double? popularity;
  final String? mediaType;

  Movie(
      {this.adult,
        this.backdropPath,
        this.overview,
        this.genreIds,
        this.originalLanguage,
        this.originalTitle,
        this.id,
        this.video,
        this.voteAverage,
        this.title,
        this.voteCount,
        this.releaseDate,
        this.posterPath,
        this.popularity,
        this.mediaType});
  factory Movie.fromJson(Map<String, dynamic> json){
    return Movie(
      adult: json['adult'],
      backdropPath: json['backdrop_path'],
      overview: json['overview'],
      genreIds: json['genre_ids'].map<int>((e) => e as int).toList(),
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      id: json['id'],
      video: json['video'],
      voteAverage: json['vote_average'],
      title: json['title'],
      voteCount: json['vote_count'],
      releaseDate: json['release_date'],
      posterPath: json['poster_path'],
      popularity: json['popularity'],
      mediaType: json['media_type'],
    );
  }
}
