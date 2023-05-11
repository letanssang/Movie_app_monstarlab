// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trending_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TrendingState {
  bool get isOnTop => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  ScrollController get scrollController => throw _privateConstructorUsedError;
  int get listSize => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TrendingStateCopyWith<TrendingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrendingStateCopyWith<$Res> {
  factory $TrendingStateCopyWith(
          TrendingState value, $Res Function(TrendingState) then) =
      _$TrendingStateCopyWithImpl<$Res, TrendingState>;
  @useResult
  $Res call(
      {bool isOnTop,
      bool isLoading,
      ScrollController scrollController,
      int listSize});
}

/// @nodoc
class _$TrendingStateCopyWithImpl<$Res, $Val extends TrendingState>
    implements $TrendingStateCopyWith<$Res> {
  _$TrendingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isOnTop = null,
    Object? isLoading = null,
    Object? scrollController = null,
    Object? listSize = null,
  }) {
    return _then(_value.copyWith(
      isOnTop: null == isOnTop
          ? _value.isOnTop
          : isOnTop // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      scrollController: null == scrollController
          ? _value.scrollController
          : scrollController // ignore: cast_nullable_to_non_nullable
              as ScrollController,
      listSize: null == listSize
          ? _value.listSize
          : listSize // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TrendingStateCopyWith<$Res>
    implements $TrendingStateCopyWith<$Res> {
  factory _$$_TrendingStateCopyWith(
          _$_TrendingState value, $Res Function(_$_TrendingState) then) =
      __$$_TrendingStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isOnTop,
      bool isLoading,
      ScrollController scrollController,
      int listSize});
}

/// @nodoc
class __$$_TrendingStateCopyWithImpl<$Res>
    extends _$TrendingStateCopyWithImpl<$Res, _$_TrendingState>
    implements _$$_TrendingStateCopyWith<$Res> {
  __$$_TrendingStateCopyWithImpl(
      _$_TrendingState _value, $Res Function(_$_TrendingState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isOnTop = null,
    Object? isLoading = null,
    Object? scrollController = null,
    Object? listSize = null,
  }) {
    return _then(_$_TrendingState(
      isOnTop: null == isOnTop
          ? _value.isOnTop
          : isOnTop // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      scrollController: null == scrollController
          ? _value.scrollController
          : scrollController // ignore: cast_nullable_to_non_nullable
              as ScrollController,
      listSize: null == listSize
          ? _value.listSize
          : listSize // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_TrendingState implements _TrendingState {
  const _$_TrendingState(
      {this.isOnTop = true,
      this.isLoading = false,
      required this.scrollController,
      this.listSize = 5});

  @override
  @JsonKey()
  final bool isOnTop;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  final ScrollController scrollController;
  @override
  @JsonKey()
  final int listSize;

  @override
  String toString() {
    return 'TrendingState(isOnTop: $isOnTop, isLoading: $isLoading, scrollController: $scrollController, listSize: $listSize)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TrendingState &&
            (identical(other.isOnTop, isOnTop) || other.isOnTop == isOnTop) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.scrollController, scrollController) ||
                other.scrollController == scrollController) &&
            (identical(other.listSize, listSize) ||
                other.listSize == listSize));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isOnTop, isLoading, scrollController, listSize);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TrendingStateCopyWith<_$_TrendingState> get copyWith =>
      __$$_TrendingStateCopyWithImpl<_$_TrendingState>(this, _$identity);
}

abstract class _TrendingState implements TrendingState {
  const factory _TrendingState(
      {final bool isOnTop,
      final bool isLoading,
      required final ScrollController scrollController,
      final int listSize}) = _$_TrendingState;

  @override
  bool get isOnTop;
  @override
  bool get isLoading;
  @override
  ScrollController get scrollController;
  @override
  int get listSize;
  @override
  @JsonKey(ignore: true)
  _$$_TrendingStateCopyWith<_$_TrendingState> get copyWith =>
      throw _privateConstructorUsedError;
}
