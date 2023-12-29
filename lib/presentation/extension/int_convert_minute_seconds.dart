import 'package:tabata_timer/common/constants.dart';

extension IntConvertMinuteSeconds on int {
  String convertMinuteSeconds() {
    final minute = '${this ~/ maximumMinute}'.padLeft(2, '0');
    final seconds = '${this % maximumSeconds}'.padLeft(2, '0');
    return '$minute:$seconds';
  }
}
