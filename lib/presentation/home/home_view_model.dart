import 'package:flutter/foundation.dart';
import 'package:tabata_timer/common/constants.dart';
import 'package:tabata_timer/common/extension/int_to_time.dart';
import 'package:tabata_timer/presentation/model/tabata.dart';
import 'package:tabata_timer/presentation/model/tabata_element.dart';
import 'package:tabata_timer/repository/shared_preferences_repository.dart';

final class HomeViewModel with ChangeNotifier {
  final _repository = DefaultSharedPreferencesRepository();
  final _tabata = Tabata();

  HomeViewModel() {
    loadAll();
  }

  Time get totalTime => _tabata.totalMinuteSeconds.toTime();

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
        _tabata.preparationSeconds += 1;
        break;
      case TabataElement.cycle:
        _tabata.cycleCount += 1;
        break;
      case TabataElement.cycleBreakTime:
        _tabata.cycleBreakSeconds += 1;
        break;
      case TabataElement.round:
        _tabata.roundCount += 1;
        break;
      case TabataElement.exerciseTime:
        _tabata.exerciseSeconds += 1;
        break;
      case TabataElement.breakTime:
        _tabata.breakSeconds += 1;
        break;
    }
    save(element: element);
    notifyListeners();
  }

  void decrease({required TabataElement element}) {
    switch (element) {
      case TabataElement.preparationTime:
        _tabata.preparationSeconds -= 1;
        break;
      case TabataElement.cycle:
        _tabata.cycleCount -= 1;
        break;
      case TabataElement.cycleBreakTime:
        _tabata.cycleBreakSeconds -= 1;
        break;
      case TabataElement.round:
        _tabata.roundCount -= 1;
        break;
      case TabataElement.exerciseTime:
        _tabata.exerciseSeconds -= 1;
        break;
      case TabataElement.breakTime:
        _tabata.breakSeconds -= 1;
        break;
    }
    save(element: element);
    notifyListeners();
  }

  void updateCount(TabataElement element, {required int value}) {
    switch (element) {
      case TabataElement.cycle:
        _tabata.cycleCount = value;
        break;
      case TabataElement.round:
        _tabata.roundCount = value;
        break;
      default:
        throw Exception();
    }
    save(element: element);
    notifyListeners();
  }

  void updateTime(TabataElement element, {required int minute, required int second}) {
    switch (element) {
      case TabataElement.preparationTime:
        _tabata.preparationSeconds = (minute * 60) + second;
        break;
      case TabataElement.cycleBreakTime:
        _tabata.cycleBreakSeconds = (minute * 60) + second;
        break;
      case TabataElement.exerciseTime:
        _tabata.exerciseSeconds = (minute * 60) + second;
        break;
      case TabataElement.breakTime:
        _tabata.breakSeconds = (minute * 60) + second;
        break;
      default:
        throw Exception();
    }
    save(element: element);
    notifyListeners();
  }

  Future<void> loadAll() async {
    final result = await _repository.loadAll();
    _tabata.updateValueFromMap(result);
    notifyListeners();
  }

  void save({required TabataElement element}) {
    switch (element) {
      case TabataElement.preparationTime:
        _repository.save(element.key, _tabata.preparationSeconds);
      case TabataElement.cycle:
        _repository.save(element.key, _tabata.cycleCount);
      case TabataElement.cycleBreakTime:
        _repository.save(element.key, _tabata.cycleBreakSeconds);
      case TabataElement.round:
        _repository.save(element.key, _tabata.roundCount);
      case TabataElement.exerciseTime:
        _repository.save(element.key, _tabata.exerciseSeconds);
      case TabataElement.breakTime:
        _repository.save(element.key, _tabata.breakSeconds);
    }
  }
}
