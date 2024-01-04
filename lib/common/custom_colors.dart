import 'package:flutter/material.dart';
import 'package:tabata_timer/domain/model/tabata_element.dart';

final class CustomColors {
  static const Color blueColor = Color(0xFF0085FF);
  static const Color yellowColor = Color(0xFFFFE812);
  static const Color greenColor = Color(0xFF34A853);
  static const Color redColor = Color(0xFFEA4335);
  static const Color orangeColor = Color(0xFFFBBC04);

  static Color getColorOf(TabataElement element) {
    switch (element) {
      case TabataElement.preparationTime:
        return yellowColor;
      case TabataElement.cycle:
        return Colors.black;
      case TabataElement.cycleBreakTime:
        return orangeColor;
      case TabataElement.round:
        return Colors.black;
      case TabataElement.exerciseTime:
        return greenColor;
      case TabataElement.breakTime:
        return redColor;
    }
  }
}