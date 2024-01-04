import 'package:tabata_timer/common/constants.dart';

final class Tabata {
  int _preparationSeconds;
  int _cycleCount;
  int _cycleBreakSeconds;
  int _roundCount;
  int _exerciseSeconds;
  int _breakSeconds;

  Tabata({
    int preparationSeconds = defaultPreparationSeconds,
    int cycleCount = defaultCycleCount,
    int cycleBreakSeconds = defaultCycleBreakSeconds,
    int roundCount = defaultRoundCount,
    int exerciseSeconds = defaultExerciseSeconds,
    int breakSeconds = defaultBreakSeconds,
  })  : _preparationSeconds = preparationSeconds,
        _cycleCount = cycleCount,
        _cycleBreakSeconds = cycleBreakSeconds,
        _roundCount = roundCount,
        _exerciseSeconds = exerciseSeconds,
        _breakSeconds = breakSeconds;

  int get breakSeconds => _breakSeconds;

  int get exerciseSeconds => _exerciseSeconds;

  int get roundCount => _roundCount;

  int get cycleBreakSeconds => _cycleBreakSeconds;

  int get cycleCount => _cycleCount;

  int get preparationSeconds => _preparationSeconds;

  set breakSeconds(int value) {
    if (value <= maximumTime && value >= minimum) _breakSeconds = value;
  }

  set exerciseSeconds(int value) {
    if (value <= maximumTime && value >= minimum) _exerciseSeconds = value;
  }

  set roundCount(int value) {
    if (value <= maximumRoundCount && value >= minimum) _roundCount = value;
  }

  set cycleBreakSeconds(int value) {
    if (value <= maximumTime && value >= minimum) _cycleBreakSeconds = value;
  }

  set cycleCount(int value) {
    if (value <= maximumCycleCount && value >= minimum) _cycleCount = value;
  }

  set preparationSeconds(int value) {
    if (value <= maximumTime && value >= minimum) _preparationSeconds = value;
  }

  int get totalMinuteSeconds {
    final roundSeconds = _exerciseSeconds + _breakSeconds;
    final totalRoundSeconds = (roundSeconds * _roundCount) - _breakSeconds;
    final cycleSeconds = totalRoundSeconds + _cycleBreakSeconds;
    final totalCycleSeconds = (cycleSeconds * _cycleCount) - _cycleBreakSeconds;
    return _preparationSeconds + totalCycleSeconds;
  }

  void updateValueFromMap(Map<String, int?> map) {
    _preparationSeconds = map[preparationSecondsKey] ?? _preparationSeconds;
    _cycleBreakSeconds = map[cycleBreakSecondsKey] ?? _cycleBreakSeconds;
    _cycleCount = map[cycleCountKey] ?? _cycleCount;
    _roundCount = map[roundCountKey] ?? _roundCount;
    _exerciseSeconds = map[exerciseSecondsKey] ?? _exerciseSeconds;
    _breakSeconds = map[breakSecondsKey] ?? _breakSeconds;
  }
}