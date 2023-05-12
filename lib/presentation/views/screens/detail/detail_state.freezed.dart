// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DetailState {
  FetchState get fetchState => throw _privateConstructorUsedError;
  Movie get movie => throw _privateConstructorUsedError;
  List<String> get genres => throw _privateConstructorUsedError;
  List<Movie> get similarMovies => throw _privateConstructorUsedError;
  bool get isFavorite => throw _privateConstructorUsedError;
  ScrollController get scrollController => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DetailStateCopyWith<DetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailStateCopyWith<$Res> {
  factory $DetailStateCopyWith(
          DetailState value, $Res Function(DetailState) then) =
      _$DetailStateCopyWithImpl<$Res, DetailState>;
  @useResult
  $Res call(
      {FetchState fetchState,
      Movie movie,
      List<String> genres,
      List<Movie> similarMovies,
      bool isFavorite,
      ScrollController scrollController});
}

/// @nodoc
class _$DetailStateCopyWithImpl<$Res, $Val extends DetailState>
    implements $DetailStateCopyWith<$Res> {
  _$DetailStateCopyWithImpl(this._value, this._then);

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
    Object? scrollController = null,
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
      scrollController: null == scrollController
          ? _value.scrollController
          : scrollController // ignore: cast_nullable_to_non_nullable
              as ScrollController,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DetailStateCopyWith<$Res>
    implements $DetailStateCopyWith<$Res> {
  factory _$$_DetailStateCopyWith(
          _$_DetailState value, $Res Function(_$_DetailState) then) =
      __$$_DetailStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FetchState fetchState,
      Movie movie,
      List<String> genres,
      List<Movie> similarMovies,
      bool isFavorite,
      ScrollController scrollController});
}

/// @nodoc
class __$$_DetailStateCopyWithImpl<$Res>
    extends _$DetailStateCopyWithImpl<$Res, _$_DetailState>
    implements _$$_DetailStateCopyWith<$Res> {
  __$$_DetailStateCopyWithImpl(
      _$_DetailState _value, $Res Function(_$_DetailState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fetchState = null,
    Object? movie = null,
    Object? genres = null,
    Object? similarMovies = null,
    Object? isFavorite = null,
    Object? scrollController = null,
  }) {
    return _then(_$_DetailState(
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
      scrollController: null == scrollController
          ? _value.scrollController
          : scrollController // ignore: cast_nullable_to_non_nullable
              as ScrollController,
    ));
  }
}

/// @nodoc

class _$_DetailState implements _DetailState {
  const _$_DetailState(
      {this.fetchState = FetchState.init,
      this.movie = const Movie(),
      final List<String> genres = const [],
      final List<Movie> similarMovies = const [],
      this.isFavorite = false,
      required this.scrollController})
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
  final ScrollController scrollController;

  @override
  String toString() {
    return 'DetailState(fetchState: $fetchState, movie: $movie, genres: $genres, similarMovies: $similarMovies, isFavorite: $isFavorite, scrollController: $scrollController)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DetailState &&
            (identical(other.fetchState, fetchState) ||
                other.fetchState == fetchState) &&
            (identical(other.movie, movie) || other.movie == movie) &&
            const DeepCollectionEquality().equals(other._genres, _genres) &&
            const DeepCollectionEquality()
                .equals(other._similarMovies, _similarMovies) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite) &&
            (identical(other.scrollController, scrollController) ||
                other.scrollController == scrollController));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      fetchState,
      movie,
      const DeepCollectionEquality().hash(_genres),
      const DeepCollectionEquality().hash(_similarMovies),
      isFavorite,
      scrollController);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DetailStateCopyWith<_$_DetailState> get copyWith =>
      __$$_DetailStateCopyWithImpl<_$_DetailState>(this, _$identity);
}

abstract class _DetailState implements DetailState {
  const factory _DetailState(
      {final FetchState fetchState,
      final Movie movie,
      final List<String> genres,
      final List<Movie> similarMovies,
      final bool isFavorite,
      required final ScrollController scrollController}) = _$_DetailState;

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
  ScrollController get scrollController;
  @override
  @JsonKey(ignore: true)
  _$$_DetailStateCopyWith<_$_DetailState> get copyWith =>
      throw _privateConstructorUsedError;
}
