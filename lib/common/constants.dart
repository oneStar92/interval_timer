import 'package:tabata_timer/presentation/model/tabata_element.dart';

typedef Count = ({String current, String max});
typedef Time = ({String minute, String second});

const int maximumTime = 3599;
const int minimum = 1;
const int maximumCount = 99;
const int maximumMinute = 59;
const int maximumSeconds = 59;
const int defaultPreparationSeconds = 60;
const int defaultCycleCount = 3;
const int defaultCycleBreakSeconds = 30;
const int defaultRoundCount = 7;
const int defaultExerciseSeconds = 90;
const int defaultBreakSeconds = 10;

final List<String> countList = List<String>.generate(maximumCount, (index) => '${index + 1}');
final List<String> minuteList = List<String>.generate(maximumMinute, (index) => '${index + 1}');
final List<String> secondsList = List<String>.generate(maximumSeconds, (index) => '${index + 1}');

const String appTitle = '타바타';
const String exerciseButtonTitle = '운동 시작';
const String preparationSecondsTitle = '준비';
const String cycleCountTitle = '사이클';
const String cycleBreakSecondsTitle = '사이클 휴식';
const String roundCountTitle = '라운드';
const String exerciseSecondsTitle = '운동';
const String breakSecondsTitle = '휴식';
const String preparationSecondsKey = 'preparationSeconds';
const String cycleCountKey = 'cycleCount';
const String cycleBreakSecondsKey = 'cycleBreakSeconds';
const String roundCountKey = 'roundCount';
const String exerciseSecondsKey = 'exerciseSeconds';
const String breakSecondsKey = 'breakSeconds';

const List<List<TabataElement>> homeScreenRowsGroupedBySection = [
  [TabataElement.preparationTime],
  [TabataElement.round, TabataElement.exerciseTime, TabataElement.breakTime],
  [TabataElement.cycle, TabataElement.cycleBreakTime],
];
final int sectionCount = homeScreenRowsGroupedBySection.length;