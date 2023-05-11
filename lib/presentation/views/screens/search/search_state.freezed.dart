// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SearchState {
  Timer? get searchOnStoppedTyping => throw _privateConstructorUsedError;
  FetchState get fetchState => throw _privateConstructorUsedError;
  TextEditingController get textEditingController =>
      throw _privateConstructorUsedError;
  FocusNode get focusNode => throw _privateConstructorUsedError;
  List<Movie> get suggestions => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchStateCopyWith<SearchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchStateCopyWith<$Res> {
  factory $SearchStateCopyWith(
          SearchState value, $Res Function(SearchState) then) =
      _$SearchStateCopyWithImpl<$Res, SearchState>;
  @useResult
  $Res call(
      {Timer? searchOnStoppedTyping,
      FetchState fetchState,
      TextEditingController textEditingController,
      FocusNode focusNode,
      List<Movie> suggestions});
}

/// @nodoc
class _$SearchStateCopyWithImpl<$Res, $Val extends SearchState>
    implements $SearchStateCopyWith<$Res> {
  _$SearchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchOnStoppedTyping = freezed,
    Object? fetchState = null,
    Object? textEditingController = null,
    Object? focusNode = null,
    Object? suggestions = null,
  }) {
    return _then(_value.copyWith(
      searchOnStoppedTyping: freezed == searchOnStoppedTyping
          ? _value.searchOnStoppedTyping
          : searchOnStoppedTyping // ignore: cast_nullable_to_non_nullable
              as Timer?,
      fetchState: null == fetchState
          ? _value.fetchState
          : fetchState // ignore: cast_nullable_to_non_nullable
              as FetchState,
      textEditingController: null == textEditingController
          ? _value.textEditingController
          : textEditingController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      focusNode: null == focusNode
          ? _value.focusNode
          : focusNode // ignore: cast_nullable_to_non_nullable
              as FocusNode,
      suggestions: null == suggestions
          ? _value.suggestions
          : suggestions // ignore: cast_nullable_to_non_nullable
              as List<Movie>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SearchStateCopyWith<$Res>
    implements $SearchStateCopyWith<$Res> {
  factory _$$_SearchStateCopyWith(
          _$_SearchState value, $Res Function(_$_SearchState) then) =
      __$$_SearchStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Timer? searchOnStoppedTyping,
      FetchState fetchState,
      TextEditingController textEditingController,
      FocusNode focusNode,
      List<Movie> suggestions});
}

/// @nodoc
class __$$_SearchStateCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res, _$_SearchState>
    implements _$$_SearchStateCopyWith<$Res> {
  __$$_SearchStateCopyWithImpl(
      _$_SearchState _value, $Res Function(_$_SearchState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchOnStoppedTyping = freezed,
    Object? fetchState = null,
    Object? textEditingController = null,
    Object? focusNode = null,
    Object? suggestions = null,
  }) {
    return _then(_$_SearchState(
      searchOnStoppedTyping: freezed == searchOnStoppedTyping
          ? _value.searchOnStoppedTyping
          : searchOnStoppedTyping // ignore: cast_nullable_to_non_nullable
              as Timer?,
      fetchState: null == fetchState
          ? _value.fetchState
          : fetchState // ignore: cast_nullable_to_non_nullable
              as FetchState,
      textEditingController: null == textEditingController
          ? _value.textEditingController
          : textEditingController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      focusNode: null == focusNode
          ? _value.focusNode
          : focusNode // ignore: cast_nullable_to_non_nullable
              as FocusNode,
      suggestions: null == suggestions
          ? _value._suggestions
          : suggestions // ignore: cast_nullable_to_non_nullable
              as List<Movie>,
    ));
  }
}

/// @nodoc

class _$_SearchState implements _SearchState {
  const _$_SearchState(
      {this.searchOnStoppedTyping,
      this.fetchState = FetchState.init,
      required this.textEditingController,
      required this.focusNode,
      final List<Movie> suggestions = const []})
      : _suggestions = suggestions;

  @override
  final Timer? searchOnStoppedTyping;
  @override
  @JsonKey()
  final FetchState fetchState;
  @override
  final TextEditingController textEditingController;
  @override
  final FocusNode focusNode;
  final List<Movie> _suggestions;
  @override
  @JsonKey()
  List<Movie> get suggestions {
    if (_suggestions is EqualUnmodifiableListView) return _suggestions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_suggestions);
  }

  @override
  String toString() {
    return 'SearchState(searchOnStoppedTyping: $searchOnStoppedTyping, fetchState: $fetchState, textEditingController: $textEditingController, focusNode: $focusNode, suggestions: $suggestions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchState &&
            (identical(other.searchOnStoppedTyping, searchOnStoppedTyping) ||
                other.searchOnStoppedTyping == searchOnStoppedTyping) &&
            (identical(other.fetchState, fetchState) ||
                other.fetchState == fetchState) &&
            (identical(other.textEditingController, textEditingController) ||
                other.textEditingController == textEditingController) &&
            (identical(other.focusNode, focusNode) ||
                other.focusNode == focusNode) &&
            const DeepCollectionEquality()
                .equals(other._suggestions, _suggestions));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      searchOnStoppedTyping,
      fetchState,
      textEditingController,
      focusNode,
      const DeepCollectionEquality().hash(_suggestions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SearchStateCopyWith<_$_SearchState> get copyWith =>
      __$$_SearchStateCopyWithImpl<_$_SearchState>(this, _$identity);
}

abstract class _SearchState implements SearchState {
  const factory _SearchState(
      {final Timer? searchOnStoppedTyping,
      final FetchState fetchState,
      required final TextEditingController textEditingController,
      required final FocusNode focusNode,
      final List<Movie> suggestions}) = _$_SearchState;

  @override
  Timer? get searchOnStoppedTyping;
  @override
  FetchState get fetchState;
  @override
  TextEditingController get textEditingController;
  @override
  FocusNode get focusNode;
  @override
  List<Movie> get suggestions;
  @override
  @JsonKey(ignore: true)
  _$$_SearchStateCopyWith<_$_SearchState> get copyWith =>
      throw _privateConstructorUsedError;
}
