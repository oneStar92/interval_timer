import 'package:tabata_timer/common/constants.dart';

typedef TabataTheme = ({String title, int color});

enum TabataElement {
  preparationTime,
  cycle,
  cycleBreakTime,
  round,
  exerciseTime,
  breakTime;

  @override
  String toString() {
    switch (this) {
      case TabataElement.preparationTime:
        return preparationSecondsTitle;
      case TabataElement.cycle:
        return cycleCountTitle;
      case TabataElement.cycleBreakTime:
        return cycleBreakSecondsTitle;
      case TabataElement.round:
        return roundCountTitle;
      case TabataElement.exerciseTime:
        return exerciseSecondsTitle;
      case TabataElement.breakTime:
        return breakSecondsTitle;
    }
  }
}
