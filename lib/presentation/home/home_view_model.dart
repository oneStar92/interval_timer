import 'package:flutter/foundation.dart';
import 'package:tabata_timer/presentation/extension/int_convert_minute_seconds.dart';
import 'package:tabata_timer/presentation/model/tabata.dart';
import 'package:tabata_timer/presentation/model/tabata_element.dart';
import 'package:tabata_timer/repository/shared_preferences_repository.dart';

final class HomeViewModel with ChangeNotifier {
  final _repository = DefaultSharedPreferencesRepository();
  final _tabata = Tabata();

  HomeViewModel() {
    loadAll();
  }

  String get totalMinuteSeconds {
    final roundSeconds = _tabata.exerciseSeconds + _tabata.breakSeconds;
    final totalRoundSeconds = roundSeconds * _tabata.roundCount;
    final cycleSeconds = totalRoundSeconds + _tabata.cycleBreakSeconds;
    final totalCycleSeconds = cycleSeconds * _tabata.cycleCount;
    return (_tabata.preparationSeconds + totalCycleSeconds).convertMinuteSeconds();
  }

  String getValue({required TabataElement element}) {
    switch (element) {
      case TabataElement.preparationSeconds:
        return _tabata.preparationSeconds.convertMinuteSeconds();
      case TabataElement.cycleCount:
        return '${_tabata.cycleCount}';
      case TabataElement.cycleBreakSeconds:
        return _tabata.cycleBreakSeconds.convertMinuteSeconds();
      case TabataElement.roundCount:
        return '${_tabata.roundCount}';
      case TabataElement.exerciseSeconds:
        return _tabata.exerciseSeconds.convertMinuteSeconds();
      case TabataElement.breakSeconds:
        return _tabata.breakSeconds.convertMinuteSeconds();
    }
  }

  void increase({required TabataElement element}) {
    switch (element) {
      case TabataElement.preparationSeconds:
        _tabata.preparationSeconds += 1;
        break;
      case TabataElement.cycleCount:
        _tabata.cycleCount += 1;
        break;
      case TabataElement.cycleBreakSeconds:
        _tabata.cycleBreakSeconds += 1;
        break;
      case TabataElement.roundCount:
        _tabata.roundCount += 1;
        break;
      case TabataElement.exerciseSeconds:
        _tabata.exerciseSeconds += 1;
        break;
      case TabataElement.breakSeconds:
        _tabata.breakSeconds += 1;
        break;
    }
    save(element: element);
    notifyListeners();
  }

  void decrease({required TabataElement element}) {
    switch (element) {
      case TabataElement.preparationSeconds:
        _tabata.preparationSeconds -= 1;
        break;
      case TabataElement.cycleCount:
        _tabata.cycleCount -= 1;
        break;
      case TabataElement.cycleBreakSeconds:
        _tabata.cycleBreakSeconds -= 1;
        break;
      case TabataElement.roundCount:
        _tabata.roundCount -= 1;
        break;
      case TabataElement.exerciseSeconds:
        _tabata.exerciseSeconds -= 1;
        break;
      case TabataElement.breakSeconds:
        _tabata.breakSeconds -= 1;
        break;
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
      case TabataElement.preparationSeconds:
        _repository.save(element.key, _tabata.preparationSeconds);
      case TabataElement.cycleCount:
        _repository.save(element.key, _tabata.cycleCount);
      case TabataElement.cycleBreakSeconds:
        _repository.save(element.key, _tabata.cycleBreakSeconds);
      case TabataElement.roundCount:
        _repository.save(element.key, _tabata.roundCount);
      case TabataElement.exerciseSeconds:
        _repository.save(element.key, _tabata.exerciseSeconds);
      case TabataElement.breakSeconds:
        _repository.save(element.key, _tabata.breakSeconds);
    }
  }
}
