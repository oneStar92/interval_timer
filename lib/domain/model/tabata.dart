import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'tabata.freezed.dart';

part 'tabata.g.dart';

@freezed
class Tabata with _$Tabata {
  @Assert('preparationSeconds <= 3599 && preparationSeconds >= 1')
  @Assert('cycleCount <= 10 && cycleCount >= 1')
  @Assert('cycleBreakSeconds <= 3599 && cycleBreakSeconds >= 1')
  @Assert('roundCount <= 20 && roundCount >= 1')
  @Assert('exerciseSeconds <= 3599 && exerciseSeconds >= 1')
  @Assert('breakSeconds <= 3599 && breakSeconds >= 1')
  const factory Tabata({
    @Default(60) int preparationSeconds,
    @Default(3) int cycleCount,
    @Default(30) int cycleBreakSeconds,
    @Default(7) int roundCount,
    @Default(90) int exerciseSeconds,
    @Default(10) int breakSeconds,
  }) = _Tabata;

  const Tabata._();

  int get totalTime {
    final roundSeconds = exerciseSeconds + breakSeconds;
    final totalRoundSeconds = (roundSeconds * roundCount) - breakSeconds;
    final cycleSeconds = totalRoundSeconds + cycleBreakSeconds;
    final totalCycleSeconds = (cycleSeconds * cycleCount) - cycleBreakSeconds;
    return preparationSeconds + totalCycleSeconds;
  }

  factory Tabata.fromJson(Map<String, Object?> json) => _$TabataFromJson(json);
}
