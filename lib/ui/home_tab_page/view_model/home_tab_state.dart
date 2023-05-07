import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'home_tab_state.freezed.dart';
@freezed
class HomeTabState with _$HomeTabState {
  const factory HomeTabState({
    required final PageController pageController,
    required double currentPage,
  }) = _HomeTabState;
}