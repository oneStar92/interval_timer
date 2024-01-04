import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:tabata_timer/common/constants.dart';
import 'package:tabata_timer/common/extension/int_to_time.dart';
import 'package:tabata_timer/domain/model/tabata.dart';
import 'package:tabata_timer/domain/model/tabata_element.dart';
import 'package:tabata_timer/presentation/tabata/tabata_view_state.dart';

final class TabataViewModel with ChangeNotifier {
  final Tabata _tabata;
  Timer? _timer;
  TabataViewState _state = const TabataViewState();

  TabataViewModel({
    required Tabata tabata,
  }) : _tabata = tabata;

  RemainingCount get round => (current: '${_state.currentRound}', max: '${_tabata.roundCount}');

  RemainingCount get cycle => (current: '${_state.currentCycle}', max: '${_tabata.cycleCount}');

  TabataElement get currentState => _state.currentState;

  Time get currentStateRemainingTime => (currentStateMaximumSecond - _state.currentStateProgressedSecond).toTime();

  int get currentStateMaximumSecond {
    switch (_state.currentState) {
      case TabataElement.preparationTime:
        return _tabata.preparationSeconds;
      case TabataElement.cycleBreakTime:
        return _tabata.cycleBreakSeconds;
      case TabataElement.exerciseTime:
        return _tabata.exerciseSeconds;
      case TabataElement.breakTime:
        return _tabata.breakSeconds;
      default:
        throw Exception();
    }
  }

  Time get remainingTime => (_tabata.totalTime - _state.totalProgressedSecond).toTime();

  bool get isPlaying => _timer?.isActive ?? false;

  void start() {
    if (_state.isEnd) reset();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _increaseOneSecond();
      if (_state.currentStateProgressedSecond == currentStateMaximumSecond) {
        _next();
      }
    });
    notifyListeners();
  }

  void pause() {
    _timer?.cancel();
    notifyListeners();
  }

  void _end() {
    _timer?.cancel();
    _state = _state.copyWith(isEnd: true);
  }

  void reset() {
    _timer?.cancel();
    _state = const TabataViewState();
    notifyListeners();
  }

  void _next() {
    switch (_state.currentState) {
      case TabataElement.preparationTime:
        _setStateToExercise();
        break;
      case TabataElement.exerciseTime:
        _state.currentRound < _tabata.roundCount ? _setStateToBreakTime() : _setStateToCycleBreakTime();
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
    notifyListeners();
  }

  void _setStateToExercise() {
    _state = _state.copyWith(currentState: TabataElement.exerciseTime, currentStateProgressedSecond: 0);
  }

  void _setStateToBreakTime() {
    _state = _state.copyWith(currentState: TabataElement.breakTime, currentStateProgressedSecond: 0);
  }

  void _setStateToCycleBreakTime() {
    if (_state.currentCycle == _tabata.cycleCount) return _end();
    _state = _state.copyWith(currentState: TabataElement.cycleBreakTime, currentStateProgressedSecond: 0);
  }

  void _increaseCycle() {
    _state = _state.copyWith(currentRound: 1, currentCycle: _state.currentCycle + 1);
  }

  void _increaseRound() {
    _state = _state.copyWith(currentRound: _state.currentRound + 1);
  }

  void _increaseOneSecond() {
    _state = _state.copyWith(
      currentStateProgressedSecond: _state.currentStateProgressedSecond + 1,
      totalProgressedSecond: _state.totalProgressedSecond + 1,
    );
    notifyListeners();
  }
}
