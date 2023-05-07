// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Movie _$$_MovieFromJson(Map<String, dynamic> json) => _$_Movie(
      adult: json['adult'] as bool?,
      backdropPath: json['backdrop_path'] as String?,
      overview: json['overview'] as String?,
      genreIds:
          (json['genre_ids'] as List<dynamic>?)?.map((e) => e as int).toList(),
      originalLanguage: json['original_language'] as String?,
      originalTitle: json['original_title'] as String?,
      id: json['id'] as int?,
      video: json['video'] as bool?,
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
      title: json['title'] as String?,
      voteCount: json['vote_count'] as int?,
      releaseDate: json['release_date'] as String?,
      posterPath: json['poster_path'] as String?,
      popularity: (json['popularity'] as num?)?.toDouble(),
      mediaType: json['media_type'] as String?,
    );

Map<String, dynamic> _$$_MovieToJson(_$_Movie instance) => <String, dynamic>{
      'adult': instance.adult,
      'backdrop_path': instance.backdropPath,
      'overview': instance.overview,
      'genre_ids': instance.genreIds,
      'original_language': instance.originalLanguage,
      'original_title': instance.originalTitle,
      'id': instance.id,
      'video': instance.video,
      'vote_average': instance.voteAverage,
      'title': instance.title,
      'vote_count': instance.voteCount,
      'release_date': instance.releaseDate,
      'poster_path': instance.posterPath,
      'popularity': instance.popularity,
      'media_type': instance.mediaType,
    };
