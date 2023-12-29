import 'package:tabata_timer/common/constants.dart';

typedef TabataTheme = ({String title, int color});

enum TabataElement {
  preparationSeconds,
  cycleCount,
  cycleBreakSeconds,
  roundCount,
  exerciseSeconds,
  breakSeconds;

  TabataTheme get theme {
    switch (this) {
      case TabataElement.preparationSeconds:
        return (title: preparationSecondsTitle, color: yellowColor);
      case TabataElement.cycleCount:
        return (title: cycleCountTitle, color: blackColor);
      case TabataElement.cycleBreakSeconds:
        return (title: cycleBreakSecondsTitle, color: orangeColor);
      case TabataElement.roundCount:
        return (title: roundCountTitle, color: blackColor);
      case TabataElement.exerciseSeconds:
        return (title: exerciseSecondsTitle, color: greenColor);
      case TabataElement.breakSeconds:
        return (title: breakSecondsTitle, color: redColor);
    }
  }

  String get key {
    switch (this) {
      case TabataElement.preparationSeconds:
        return preparationSecondsKey;
      case TabataElement.cycleCount:
        return cycleCountKey;
      case TabataElement.cycleBreakSeconds:
        return cycleBreakSecondsKey;
      case TabataElement.roundCount:
        return roundCountKey;
      case TabataElement.exerciseSeconds:
        return exerciseSecondsKey;
      case TabataElement.breakSeconds:
        return breakSecondsKey;
    }
  }
}
