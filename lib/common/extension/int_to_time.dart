import 'package:tabata_timer/common/constants.dart';

extension IntToTime on int {
  Time toTime() => (minute: '${this ~/ 60}'.padLeft(2, '0'), second: '${this % 60}'.padLeft(2, '0'));
}