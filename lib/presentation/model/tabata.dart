import 'package:tabata_timer/common/constants.dart';

final class Tabata {
  int _preparationSeconds;
  int _cycleCount;
  int _cycleBreakSeconds;
  int _roundCount;
  int _exerciseSeconds;
  int _breakSeconds;

  Tabata({
    int preparationSeconds = minimum,
    int cycleCount = minimum,
    int cycleBreakSeconds = minimum,
    int roundCount = minimum,
    int exerciseSeconds = minimum,
    int breakSeconds = minimum,
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
    if (value < maximumTime && value > minimum) _breakSeconds = value;
  }

  set exerciseSeconds(int value) {
    if (value < maximumTime && value > minimum) _exerciseSeconds = value;
  }

  set roundCount(int value) {
    if (value < maximumCount && value > minimum) _roundCount = value;
  }

  set cycleBreakSeconds(int value) {
    if (value < maximumTime && value > minimum) _cycleBreakSeconds = value;
  }

  set cycleCount(int value) {
    if (value < maximumCount && value > minimum) _cycleCount = value;
  }

  set preparationSeconds(int value) {
    if (value < maximumTime && value > minimum) _preparationSeconds = value;
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