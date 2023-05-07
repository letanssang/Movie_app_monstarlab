// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_tab_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeTabState {
  PageController get pageController => throw _privateConstructorUsedError;
  double get currentPage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeTabStateCopyWith<HomeTabState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeTabStateCopyWith<$Res> {
  factory $HomeTabStateCopyWith(
          HomeTabState value, $Res Function(HomeTabState) then) =
      _$HomeTabStateCopyWithImpl<$Res, HomeTabState>;
  @useResult
  $Res call({PageController pageController, double currentPage});
}

/// @nodoc
class _$HomeTabStateCopyWithImpl<$Res, $Val extends HomeTabState>
    implements $HomeTabStateCopyWith<$Res> {
  _$HomeTabStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageController = null,
    Object? currentPage = null,
  }) {
    return _then(_value.copyWith(
      pageController: null == pageController
          ? _value.pageController
          : pageController // ignore: cast_nullable_to_non_nullable
              as PageController,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HomeTabStateCopyWith<$Res>
    implements $HomeTabStateCopyWith<$Res> {
  factory _$$_HomeTabStateCopyWith(
          _$_HomeTabState value, $Res Function(_$_HomeTabState) then) =
      __$$_HomeTabStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PageController pageController, double currentPage});
}

/// @nodoc
class __$$_HomeTabStateCopyWithImpl<$Res>
    extends _$HomeTabStateCopyWithImpl<$Res, _$_HomeTabState>
    implements _$$_HomeTabStateCopyWith<$Res> {
  __$$_HomeTabStateCopyWithImpl(
      _$_HomeTabState _value, $Res Function(_$_HomeTabState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageController = null,
    Object? currentPage = null,
  }) {
    return _then(_$_HomeTabState(
      pageController: null == pageController
          ? _value.pageController
          : pageController // ignore: cast_nullable_to_non_nullable
              as PageController,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_HomeTabState implements _HomeTabState {
  const _$_HomeTabState(
      {required this.pageController, required this.currentPage});

  @override
  final PageController pageController;
  @override
  final double currentPage;

  @override
  String toString() {
    return 'HomeTabState(pageController: $pageController, currentPage: $currentPage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HomeTabState &&
            (identical(other.pageController, pageController) ||
                other.pageController == pageController) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pageController, currentPage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HomeTabStateCopyWith<_$_HomeTabState> get copyWith =>
      __$$_HomeTabStateCopyWithImpl<_$_HomeTabState>(this, _$identity);
}

abstract class _HomeTabState implements HomeTabState {
  const factory _HomeTabState(
      {required final PageController pageController,
      required final double currentPage}) = _$_HomeTabState;

  @override
  PageController get pageController;
  @override
  double get currentPage;
  @override
  @JsonKey(ignore: true)
  _$$_HomeTabStateCopyWith<_$_HomeTabState> get copyWith =>
      throw _privateConstructorUsedError;
}
