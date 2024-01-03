import 'package:tabata_timer/common/constants.dart';

typedef TabataTheme = ({String title, int color});

enum TabataElement {
  preparationTime,
  cycle,
  cycleBreakTime,
  round,
  exerciseTime,
  breakTime;

  TabataTheme get theme {
    switch (this) {
      case TabataElement.preparationTime:
        return (title: preparationSecondsTitle, color: yellowColor);
      case TabataElement.cycle:
        return (title: cycleCountTitle, color: blackColor);
      case TabataElement.cycleBreakTime:
        return (title: cycleBreakSecondsTitle, color: orangeColor);
      case TabataElement.round:
        return (title: roundCountTitle, color: blackColor);
      case TabataElement.exerciseTime:
        return (title: exerciseSecondsTitle, color: greenColor);
      case TabataElement.breakTime:
        return (title: breakSecondsTitle, color: redColor);
    }
  }

  String get key {
    switch (this) {
      case TabataElement.preparationTime:
        return preparationSecondsKey;
      case TabataElement.cycle:
        return cycleCountKey;
      case TabataElement.cycleBreakTime:
        return cycleBreakSecondsKey;
      case TabataElement.round:
        return roundCountKey;
      case TabataElement.exerciseTime:
        return exerciseSecondsKey;
      case TabataElement.breakTime:
        return breakSecondsKey;
    }
  }
}
