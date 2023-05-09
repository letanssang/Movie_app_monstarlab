// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MovieDetailState {
  FetchState get fetchState => throw _privateConstructorUsedError;
  Movie get movie => throw _privateConstructorUsedError;
  List<String> get genres => throw _privateConstructorUsedError;
  List<Movie> get similarMovies => throw _privateConstructorUsedError;
  bool get isFavorite => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MovieDetailStateCopyWith<MovieDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieDetailStateCopyWith<$Res> {
  factory $MovieDetailStateCopyWith(
          MovieDetailState value, $Res Function(MovieDetailState) then) =
      _$MovieDetailStateCopyWithImpl<$Res, MovieDetailState>;
  @useResult
  $Res call(
      {FetchState fetchState,
      Movie movie,
      List<String> genres,
      List<Movie> similarMovies,
      bool isFavorite});
}

/// @nodoc
class _$MovieDetailStateCopyWithImpl<$Res, $Val extends MovieDetailState>
    implements $MovieDetailStateCopyWith<$Res> {
  _$MovieDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fetchState = null,
    Object? movie = null,
    Object? genres = null,
    Object? similarMovies = null,
    Object? isFavorite = null,
  }) {
    return _then(_value.copyWith(
      fetchState: null == fetchState
          ? _value.fetchState
          : fetchState // ignore: cast_nullable_to_non_nullable
              as FetchState,
      movie: null == movie
          ? _value.movie
          : movie // ignore: cast_nullable_to_non_nullable
              as Movie,
      genres: null == genres
          ? _value.genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<String>,
      similarMovies: null == similarMovies
          ? _value.similarMovies
          : similarMovies // ignore: cast_nullable_to_non_nullable
              as List<Movie>,
      isFavorite: null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MovieDetailStateCopyWith<$Res>
    implements $MovieDetailStateCopyWith<$Res> {
  factory _$$_MovieDetailStateCopyWith(
          _$_MovieDetailState value, $Res Function(_$_MovieDetailState) then) =
      __$$_MovieDetailStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FetchState fetchState,
      Movie movie,
      List<String> genres,
      List<Movie> similarMovies,
      bool isFavorite});
}

/// @nodoc
class __$$_MovieDetailStateCopyWithImpl<$Res>
    extends _$MovieDetailStateCopyWithImpl<$Res, _$_MovieDetailState>
    implements _$$_MovieDetailStateCopyWith<$Res> {
  __$$_MovieDetailStateCopyWithImpl(
      _$_MovieDetailState _value, $Res Function(_$_MovieDetailState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fetchState = null,
    Object? movie = null,
    Object? genres = null,
    Object? similarMovies = null,
    Object? isFavorite = null,
  }) {
    return _then(_$_MovieDetailState(
      fetchState: null == fetchState
          ? _value.fetchState
          : fetchState // ignore: cast_nullable_to_non_nullable
              as FetchState,
      movie: null == movie
          ? _value.movie
          : movie // ignore: cast_nullable_to_non_nullable
              as Movie,
      genres: null == genres
          ? _value._genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<String>,
      similarMovies: null == similarMovies
          ? _value._similarMovies
          : similarMovies // ignore: cast_nullable_to_non_nullable
              as List<Movie>,
      isFavorite: null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_MovieDetailState implements _MovieDetailState {
  const _$_MovieDetailState(
      {this.fetchState = FetchState.init,
      this.movie = const Movie(),
      final List<String> genres = const [],
      final List<Movie> similarMovies = const [],
      this.isFavorite = false})
      : _genres = genres,
        _similarMovies = similarMovies;

  @override
  @JsonKey()
  final FetchState fetchState;
  @override
  @JsonKey()
  final Movie movie;
  final List<String> _genres;
  @override
  @JsonKey()
  List<String> get genres {
    if (_genres is EqualUnmodifiableListView) return _genres;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_genres);
  }

  final List<Movie> _similarMovies;
  @override
  @JsonKey()
  List<Movie> get similarMovies {
    if (_similarMovies is EqualUnmodifiableListView) return _similarMovies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_similarMovies);
  }

  @override
  @JsonKey()
  final bool isFavorite;

  @override
  String toString() {
    return 'MovieDetailState(fetchState: $fetchState, movie: $movie, genres: $genres, similarMovies: $similarMovies, isFavorite: $isFavorite)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MovieDetailState &&
            (identical(other.fetchState, fetchState) ||
                other.fetchState == fetchState) &&
            (identical(other.movie, movie) || other.movie == movie) &&
            const DeepCollectionEquality().equals(other._genres, _genres) &&
            const DeepCollectionEquality()
                .equals(other._similarMovies, _similarMovies) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      fetchState,
      movie,
      const DeepCollectionEquality().hash(_genres),
      const DeepCollectionEquality().hash(_similarMovies),
      isFavorite);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MovieDetailStateCopyWith<_$_MovieDetailState> get copyWith =>
      __$$_MovieDetailStateCopyWithImpl<_$_MovieDetailState>(this, _$identity);
}

abstract class _MovieDetailState implements MovieDetailState {
  const factory _MovieDetailState(
      {final FetchState fetchState,
      final Movie movie,
      final List<String> genres,
      final List<Movie> similarMovies,
      final bool isFavorite}) = _$_MovieDetailState;

  @override
  FetchState get fetchState;
  @override
  Movie get movie;
  @override
  List<String> get genres;
  @override
  List<Movie> get similarMovies;
  @override
  bool get isFavorite;
  @override
  @JsonKey(ignore: true)
  _$$_MovieDetailStateCopyWith<_$_MovieDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}
