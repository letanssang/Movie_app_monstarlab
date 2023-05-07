import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'trending_state.freezed.dart';
@freezed
class TrendingState with _$TrendingState {
  const factory TrendingState ({
    @Default(false) bool isOnTop,
    @Default(false) bool isLoading,
    required final ScrollController scrollController,
    @Default(5) int listSize,
}) = _TrendingState;
}