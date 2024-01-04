import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:tabata_timer/common/constants.dart';
import 'package:tabata_timer/common/extension/int_to_time.dart';
import 'package:tabata_timer/presentation/model/tabata.dart';
import 'package:tabata_timer/presentation/model/tabata_element.dart';

final class TabataViewModel with ChangeNotifier {
  final Tabata _tabata;
  Timer? _timer;
  TabataElement _currentState = TabataElement.preparationTime;
  bool _isPlaying = false;
  bool _isEnd = false;
  int _currentRound = 1;
  int _currentCycle = 1;
  int _currentStateRemainingTime;
  int _remainingTime;

  TabataViewModel({
    required Tabata tabata,
  })  : _tabata = tabata,
        _currentStateRemainingTime = tabata.preparationSeconds,
        _remainingTime = tabata.totalMinuteSeconds;

  RemainingCount get round => (current: '$_currentRound', max: '${_tabata.roundCount}');

  RemainingCount get cycle => (current: '$_currentCycle', max: '${_tabata.cycleCount}');

  TabataElement get currentState => _currentState;

  Time get currentTime => _currentStateRemainingTime.toTime();

  Time get remainingTime => _remainingTime.toTime();

  bool get isPlaying => _isPlaying;

  void start() {
    if (_isEnd) reset();
    _isPlaying = true;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _currentStateRemainingTime--;
      _remainingTime--;
      if (_currentStateRemainingTime == 0) {
        _setState();
      }
      notifyListeners();
    });
    notifyListeners();
  }

  void pause() {
    _timer?.cancel();
    _isPlaying = false;
    notifyListeners();
  }

  void _end() {
    _timer?.cancel();
    _isPlaying = false;
    _isEnd = true;
    notifyListeners();
  }

  void reset() {
    _timer?.cancel();
    _setStateToPreparation();
    _currentRound = 1;
    _currentCycle = 1;
    _isPlaying = false;
    _isEnd = false;
    notifyListeners();
  }

  void _setState() {
    switch (_currentState) {
      case TabataElement.preparationTime:
        _setStateToExercise();
        break;
      case TabataElement.exerciseTime:
        _currentRound < _tabata.roundCount ? _setStateToBreakTime() : _setStateToCycleBreakTime();
        break;
      case TabataElement.breakTime:
        _setStateToExercise();
        _increaseRound();
        break;
      case TabataElement.cycleBreakTime:
        _setStateToExercise();
        _increaseCycle();
        break;
      default:
        throw Exception();
    }
  }

  void _setStateToPreparation() {
    _currentState = TabataElement.preparationTime;
    _currentStateRemainingTime = _tabata.preparationSeconds;
  }

  void _setStateToExercise() {
    _currentState = TabataElement.exerciseTime;
    _currentStateRemainingTime = _tabata.exerciseSeconds;
  }

  void _setStateToBreakTime() {
    _currentState = TabataElement.breakTime;
    _currentStateRemainingTime = _tabata.breakSeconds;
  }

  void _setStateToCycleBreakTime() {
    if (_currentCycle == _tabata.cycleCount) return _end();
    _currentState = TabataElement.cycleBreakTime;
    _currentStateRemainingTime = _tabata.cycleBreakSeconds;
  }

  void _increaseCycle() {
    _currentRound = 1;
    _currentCycle++;
  }

  void _increaseRound() {
    _currentRound++;
  }
}
