import 'package:flutter/foundation.dart';
import 'package:tabata_timer/common/constants.dart';
import 'package:tabata_timer/common/extension/int_to_time.dart';
import 'package:tabata_timer/domain/model/tabata.dart';
import 'package:tabata_timer/domain/model/tabata_element.dart';
import 'package:tabata_timer/domain/usecases/shared_preferences_use_case.dart';
import 'package:tabata_timer/main.dart';

final class HomeViewModel with ChangeNotifier {
  final SharedPreferencesUseCase _useCase;
  Tabata _tabata = const Tabata();

  HomeViewModel({
    required SharedPreferencesUseCase useCase,
  }) : _useCase = useCase {
    load();
  }

  Tabata get tabata => _tabata;

  Time get totalTime {
    final roundSeconds = _tabata.exerciseSeconds + _tabata.breakSeconds;
    final totalRoundSeconds = (roundSeconds * _tabata.roundCount) - _tabata.breakSeconds;
    final cycleSeconds = totalRoundSeconds + _tabata.cycleBreakSeconds;
    final totalCycleSeconds = (cycleSeconds * _tabata.cycleCount) - _tabata.cycleBreakSeconds;
    return (_tabata.preparationSeconds + totalCycleSeconds).toTime();
  }

  Time getTimeOf(TabataElement element) {
    switch (element) {
      case TabataElement.preparationTime:
        return _tabata.preparationSeconds.toTime();
      case TabataElement.cycleBreakTime:
        return _tabata.cycleBreakSeconds.toTime();
      case TabataElement.exerciseTime:
        return _tabata.exerciseSeconds.toTime();
      case TabataElement.breakTime:
        return _tabata.breakSeconds.toTime();
      default:
        throw Exception();
    }
  }

  int getIntegerCountOf(TabataElement element) {
    switch (element) {
      case TabataElement.cycle:
        return _tabata.cycleCount;
      case TabataElement.round:
        return _tabata.roundCount;
      default:
        throw Exception();
    }
  }

  int getIntegerMinuteOf(TabataElement element) {
    switch (element) {
      case TabataElement.preparationTime:
        return _tabata.preparationSeconds ~/ 60;
      case TabataElement.cycleBreakTime:
        return _tabata.cycleBreakSeconds ~/ 60;
      case TabataElement.exerciseTime:
        return _tabata.exerciseSeconds ~/ 60;
      case TabataElement.breakTime:
        return _tabata.breakSeconds ~/ 60;
      default:
        throw Exception();
    }
  }

  int getIntegerSecondOf(TabataElement element) {
    switch (element) {
      case TabataElement.preparationTime:
        return _tabata.preparationSeconds % 60;
      case TabataElement.cycleBreakTime:
        return _tabata.cycleBreakSeconds % 60;
      case TabataElement.exerciseTime:
        return _tabata.exerciseSeconds % 60;
      case TabataElement.breakTime:
        return _tabata.breakSeconds % 60;
      default:
        throw Exception();
    }
  }

  String getCountOf(TabataElement element) {
    switch (element) {
      case TabataElement.cycle:
        return '${_tabata.cycleCount}';
      case TabataElement.round:
        return '${_tabata.roundCount}';
      default:
        throw Exception();
    }
  }

  int getMaximumCountOf(TabataElement element) {
    switch (element) {
      case TabataElement.cycle:
        return maximumCycleCount;
      case TabataElement.round:
        return maximumRoundCount;
      default:
        throw Exception();
    }
  }

  void increase({required TabataElement element}) {
    switch (element) {
      case TabataElement.preparationTime:
        _tabata = _tabata.copyWith(preparationSeconds: _tabata.preparationSeconds + 1);
        break;
      case TabataElement.cycle:
        _tabata = _tabata.copyWith(cycleCount: _tabata.cycleCount + 1);
        break;
      case TabataElement.cycleBreakTime:
        _tabata = _tabata.copyWith(cycleBreakSeconds: _tabata.cycleBreakSeconds + 1);
        break;
      case TabataElement.round:
        _tabata = _tabata.copyWith(roundCount: _tabata.roundCount + 1);
        break;
      case TabataElement.exerciseTime:
        _tabata = _tabata.copyWith(exerciseSeconds: _tabata.exerciseSeconds + 1);
        break;
      case TabataElement.breakTime:
        _tabata = _tabata.copyWith(breakSeconds: _tabata.breakSeconds + 1);
        break;
    }
    save();
    notifyListeners();
  }

  void decrease({required TabataElement element}) {
    switch (element) {
      case TabataElement.preparationTime:
        _tabata = _tabata.copyWith(preparationSeconds: _tabata.preparationSeconds - 1);
        break;
      case TabataElement.cycle:
        _tabata = _tabata.copyWith(cycleCount: _tabata.cycleCount - 1);
        break;
      case TabataElement.cycleBreakTime:
        _tabata = _tabata.copyWith(cycleBreakSeconds: _tabata.cycleBreakSeconds - 1);
        break;
      case TabataElement.round:
        _tabata = _tabata.copyWith(roundCount: _tabata.roundCount - 1);
        break;
      case TabataElement.exerciseTime:
        _tabata = _tabata.copyWith(exerciseSeconds: _tabata.exerciseSeconds - 1);
        break;
      case TabataElement.breakTime:
        _tabata = _tabata.copyWith(breakSeconds: _tabata.breakSeconds - 1);
        break;
    }
    save();
    notifyListeners();
  }

  void updateCount(TabataElement element, {required int value}) {
    switch (element) {
      case TabataElement.cycle:
        _tabata = _tabata.copyWith(cycleCount: value);
        break;
      case TabataElement.round:
        _tabata = _tabata.copyWith(roundCount: value);
        break;
      default:
        throw Exception();
    }
    save();
    notifyListeners();
  }

  void updateTime(TabataElement element, {required int minute, required int second}) {
    switch (element) {
      case TabataElement.preparationTime:
        _tabata = _tabata.copyWith(preparationSeconds: (minute * 60) + second);
        break;
      case TabataElement.cycleBreakTime:
        _tabata = _tabata.copyWith(cycleBreakSeconds: (minute * 60) + second);
        break;
      case TabataElement.exerciseTime:
        _tabata = _tabata.copyWith(exerciseSeconds: (minute * 60) + second);
        break;
      case TabataElement.breakTime:
        _tabata = _tabata.copyWith(breakSeconds: (minute * 60) + second);
        break;
      default:
        throw Exception();
    }
    save();
    notifyListeners();
  }

  void load() async {
    _tabata = await _useCase.load();
    notifyListeners();
  }

  void save() {
    _useCase.save(_tabata);
  }
}
