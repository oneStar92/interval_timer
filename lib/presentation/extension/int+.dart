extension IntToMinute on int {
  String toMinute() => '${this ~/ 60}'.padLeft(2, '0');
}

extension IntToSecond on int {
  String toSecond() => '${this % 60}'.padLeft(2, '0');
}