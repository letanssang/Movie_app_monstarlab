// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movies_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MoviesState {
  List<Movie> get trendingWeek => throw _privateConstructorUsedError;
  List<Movie> get trendingDay => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MoviesStateCopyWith<MoviesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MoviesStateCopyWith<$Res> {
  factory $MoviesStateCopyWith(
          MoviesState value, $Res Function(MoviesState) then) =
      _$MoviesStateCopyWithImpl<$Res, MoviesState>;
  @useResult
  $Res call({List<Movie> trendingWeek, List<Movie> trendingDay});
}

/// @nodoc
class _$MoviesStateCopyWithImpl<$Res, $Val extends MoviesState>
    implements $MoviesStateCopyWith<$Res> {
  _$MoviesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? trendingWeek = null,
    Object? trendingDay = null,
  }) {
    return _then(_value.copyWith(
      trendingWeek: null == trendingWeek
          ? _value.trendingWeek
          : trendingWeek // ignore: cast_nullable_to_non_nullable
              as List<Movie>,
      trendingDay: null == trendingDay
          ? _value.trendingDay
          : trendingDay // ignore: cast_nullable_to_non_nullable
              as List<Movie>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MoviesStateCopyWith<$Res>
    implements $MoviesStateCopyWith<$Res> {
  factory _$$_MoviesStateCopyWith(
          _$_MoviesState value, $Res Function(_$_MoviesState) then) =
      __$$_MoviesStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Movie> trendingWeek, List<Movie> trendingDay});
}

/// @nodoc
class __$$_MoviesStateCopyWithImpl<$Res>
    extends _$MoviesStateCopyWithImpl<$Res, _$_MoviesState>
    implements _$$_MoviesStateCopyWith<$Res> {
  __$$_MoviesStateCopyWithImpl(
      _$_MoviesState _value, $Res Function(_$_MoviesState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? trendingWeek = null,
    Object? trendingDay = null,
  }) {
    return _then(_$_MoviesState(
      trendingWeek: null == trendingWeek
          ? _value._trendingWeek
          : trendingWeek // ignore: cast_nullable_to_non_nullable
              as List<Movie>,
      trendingDay: null == trendingDay
          ? _value._trendingDay
          : trendingDay // ignore: cast_nullable_to_non_nullable
              as List<Movie>,
    ));
  }
}

/// @nodoc

class _$_MoviesState implements _MoviesState {
  const _$_MoviesState(
      {final List<Movie> trendingWeek = const [],
      final List<Movie> trendingDay = const []})
      : _trendingWeek = trendingWeek,
        _trendingDay = trendingDay;

  final List<Movie> _trendingWeek;
  @override
  @JsonKey()
  List<Movie> get trendingWeek {
    if (_trendingWeek is EqualUnmodifiableListView) return _trendingWeek;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_trendingWeek);
  }

  final List<Movie> _trendingDay;
  @override
  @JsonKey()
  List<Movie> get trendingDay {
    if (_trendingDay is EqualUnmodifiableListView) return _trendingDay;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_trendingDay);
  }

  @override
  String toString() {
    return 'MoviesState(trendingWeek: $trendingWeek, trendingDay: $trendingDay)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MoviesState &&
            const DeepCollectionEquality()
                .equals(other._trendingWeek, _trendingWeek) &&
            const DeepCollectionEquality()
                .equals(other._trendingDay, _trendingDay));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_trendingWeek),
      const DeepCollectionEquality().hash(_trendingDay));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MoviesStateCopyWith<_$_MoviesState> get copyWith =>
      __$$_MoviesStateCopyWithImpl<_$_MoviesState>(this, _$identity);
}

abstract class _MoviesState implements MoviesState {
  const factory _MoviesState(
      {final List<Movie> trendingWeek,
      final List<Movie> trendingDay}) = _$_MoviesState;

  @override
  List<Movie> get trendingWeek;
  @override
  List<Movie> get trendingDay;
  @override
  @JsonKey(ignore: true)
  _$$_MoviesStateCopyWith<_$_MoviesState> get copyWith =>
      throw _privateConstructorUsedError;
}
