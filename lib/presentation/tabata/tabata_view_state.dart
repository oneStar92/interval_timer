import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:tabata_timer/domain/model/tabata_element.dart';

part 'tabata_view_state.freezed.dart';

part 'tabata_view_state.g.dart';

@freezed
class TabataViewState with _$TabataViewState {
  const factory TabataViewState({
    @Default(TabataElement.preparationTime) TabataElement currentState,
    @Default(false) bool isEnd,
    @Default(1) int currentRound,
    @Default(1) int currentCycle,
    @Default(0) int currentStateProgressedSecond,
    @Default(0) int totalProgressedSecond,
  }) = _TabataViewState;

  factory TabataViewState.fromJson(Map<String, Object?> json) => _$TabataViewStateFromJson(json);
}
