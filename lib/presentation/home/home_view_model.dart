import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tabata_timer/common/constants.dart';
import 'package:tabata_timer/presentation/extension/int_convert_minute_seconds.dart';
import 'package:tabata_timer/presentation/model/tabata_element.dart';

final class HomeViewModel with ChangeNotifier {
  int _preparationSeconds = minimum;
  int _cycleCount = minimum;
  int _cycleBreakSeconds = minimum;
  int _roundCount = minimum;
  int _exerciseSeconds = minimum;
  int _breakSeconds = minimum;

  HomeViewModel() {
    loadAll();
  }

  String get totalMinuteSeconds {
    final roundSeconds = _exerciseSeconds + _breakSeconds;
    final totalRoundSeconds = roundSeconds * _roundCount;
    final cycleSeconds = totalRoundSeconds + _cycleBreakSeconds;
    final totalCycleSeconds = cycleSeconds * _cycleCount;
    return (_preparationSeconds + totalCycleSeconds).convertMinuteSeconds();
  }

  String getValue({required TabataElement element}) {
    switch (element) {
      case TabataElement.preparationSeconds:
        return _preparationSeconds.convertMinuteSeconds();
      case TabataElement.cycleCount:
        return '$_cycleCount';
      case TabataElement.cycleBreakSeconds:
        return _cycleBreakSeconds.convertMinuteSeconds();
      case TabataElement.roundCount:
        return '$_roundCount';
      case TabataElement.exerciseSeconds:
        return _exerciseSeconds.convertMinuteSeconds();
      case TabataElement.breakSeconds:
        return _breakSeconds.convertMinuteSeconds();
    }
  }

  void increase({required TabataElement element, int value = 1}) {
    switch (element) {
      case TabataElement.preparationSeconds:
        if (_preparationSeconds == maximumTime) return;
        _preparationSeconds += value;
        break;
      case TabataElement.cycleCount:
        if (_cycleCount == maximumCount) return;
        _cycleCount += value;
        break;
      case TabataElement.cycleBreakSeconds:
        if (_cycleBreakSeconds == maximumTime) return;
        _cycleBreakSeconds += value;
        break;
      case TabataElement.roundCount:
        if (_roundCount == maximumCount) return;
        _roundCount += value;
        break;
      case TabataElement.exerciseSeconds:
        if (_exerciseSeconds == maximumTime) return;
        _exerciseSeconds += value;
        break;
      case TabataElement.breakSeconds:
        if (_breakSeconds == maximumTime) return;
        _breakSeconds += value;
        break;
    }
    saveData(element: element);
    notifyListeners();
  }

  void decrease({required TabataElement element, int value = 1}) {
    switch (element) {
      case TabataElement.preparationSeconds:
        if (_preparationSeconds == minimum) return;
        _preparationSeconds -= value;
        break;
      case TabataElement.cycleCount:
        if (_cycleCount == minimum) return;
        _cycleCount -= value;
        break;
      case TabataElement.cycleBreakSeconds:
        if (_cycleBreakSeconds == minimum) return;
        _cycleBreakSeconds -= value;
        break;
      case TabataElement.roundCount:
        if (_roundCount == minimum) return;
        _roundCount -= value;
        break;
      case TabataElement.exerciseSeconds:
        if (_exerciseSeconds == minimum) return;
        _exerciseSeconds -= value;
        break;
      case TabataElement.breakSeconds:
        if (_breakSeconds == minimum) return;
        _breakSeconds -= value;
        break;
    }
    saveData(element: element);
    notifyListeners();
  }

  Future<void> loadAll() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _preparationSeconds = prefs.getInt(preparationSecondsKey) ?? minimum;
    _roundCount = prefs.getInt(roundCountKey) ?? minimum;
    _exerciseSeconds = prefs.getInt(exerciseSecondsKey) ?? minimum;
    _breakSeconds = prefs.getInt(breakSecondsKey) ?? minimum;
    _cycleCount = prefs.getInt(cycleCountKey) ?? minimum;
    _cycleBreakSeconds = prefs.getInt(cycleBreakSecondsKey) ?? minimum;
    notifyListeners();
  }

  void saveData({required TabataElement element}) {
    switch (element) {
      case TabataElement.preparationSeconds:
        save(key: element.key, value: _preparationSeconds);
      case TabataElement.cycleCount:
        save(key: element.key, value: _cycleCount);
      case TabataElement.cycleBreakSeconds:
        save(key: element.key, value: _cycleBreakSeconds);
      case TabataElement.roundCount:
        save(key: element.key, value: _roundCount);
      case TabataElement.exerciseSeconds:
        save(key: element.key, value: _exerciseSeconds);
      case TabataElement.breakSeconds:
        save(key: element.key, value: _breakSeconds);
    }
  }

  Future<void> save({required String key, required int value}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(key, value);
  }
}
