import 'package:tabata_timer/presentation/model/tabata_element.dart';

const int maximumTime = 3600;
const int minimum = 0;
const int maximumCount = 100;
const int maximumMinute = 60;
const int maximumSeconds = 60;

final List<String> countList = List<String>.generate(maximumCount - 1, (index) => '${index + 1}');
final List<String> minuteList = List<String>.generate(maximumMinute - 1, (index) => '${index + 1}');
final List<String> secondsList = List<String>.generate(maximumSeconds - 1, (index) => '${index + 1}');

const int blueColor = 0xFF0085FF;
const int yellowColor = 0xFFFFE812;
const int greenColor = 0xFF34A853;
const int redColor = 0xFFEA4335;
const int orangeColor = 0xFFFBBC04;
const int blackColor = 0xFF000000;

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
  [TabataElement.preparationSeconds],
  [TabataElement.roundCount, TabataElement.exerciseSeconds, TabataElement.breakSeconds],
  [TabataElement.cycleCount, TabataElement.cycleBreakSeconds],
];
final int sectionCount = homeScreenRowsGroupedBySection.length;